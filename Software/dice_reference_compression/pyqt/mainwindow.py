from PyQt6.QtWidgets import (
    QMainWindow,
    QWidget,
    QVBoxLayout,
    QHBoxLayout,
    QLabel,
    QSlider,
    QPushButton,
    QScrollArea,
    QStatusBar,
)
from PyQt6.QtCore import QObject, Qt, QEvent
from PyQt6.QtGui import QPixmap, QImage, QPalette, QMouseEvent
import cv2
from cv2.typing import MatLike
import numpy as np
from numpy._core.multiarray import ndarray
from blockviewer import BlockViewer
from fpga_accelerated_compressor import resize_image
import fpga_accelerated_compressor
from processedwindow import ProcessedWindow
import image_codec


class BlockMetrics:
    def __init__(self):
        self.gradient_mean = 0.0
        self.laplacian_var = 0.0
        self.region: tuple[float, float, float, float] = (0.0, 0.0, 0.0, 0.0)


class MetricsStats:
    def __init__(self):
        self.gradient_median = 0.0
        self.laplacian_median = 0.0
        self.gradient_min = float("inf")
        self.gradient_max = float("-inf")
        self.laplacian_min = float("inf")
        self.laplacian_max = float("-inf")


class IndexBlock:
    def __init__(self):
        self.index = 0
        self.metrics: BlockMetrics | None = None


class MainWindow(QMainWindow):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setup_ui()
        # Create initial blank image
        self.original_image = np.full((480, 640, 3), 128, dtype=np.uint8)
        self.current_image = None
        self.current_image_path = ""
        self.block_metrics = []
        self.lossless_blocks: list[IndexBlock] = []
        self.lossy_blocks: list[IndexBlock] = []
        self.metrics_stats = MetricsStats()
        self.process_and_display_image()

    def setup_ui(self):
        central_widget = QWidget(self)
        self.setCentralWidget(central_widget)

        layout = QVBoxLayout(central_widget)
        layout.setContentsMargins(0, 0, 0, 0)

        # Create scroll area
        self.scroll_area = QScrollArea()
        self.scroll_area.setBackgroundRole(QPalette.ColorRole.Dark)
        self.scroll_area.setWidgetResizable(True)
        layout.addWidget(self.scroll_area)

        # Create image label
        self.image_label = QLabel()
        self.image_label.setMinimumSize(640, 480)
        self.image_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.scroll_area.setWidget(self.image_label)

        # Create control panel
        control_panel = QWidget()
        control_layout = QVBoxLayout(control_panel)

        # Gradient threshold controls
        gradient_layout = QHBoxLayout()
        gradient_label = QLabel("Gradient Threshold:")
        self.gradient_value_label = QLabel()
        self.gradient_threshold_slider = QSlider(Qt.Orientation.Horizontal)
        gradient_layout.addWidget(gradient_label)
        gradient_layout.addWidget(self.gradient_threshold_slider)
        gradient_layout.addWidget(self.gradient_value_label)
        control_layout.addLayout(gradient_layout)

        # Laplacian threshold controls
        laplacian_layout = QHBoxLayout()
        laplacian_label = QLabel("Laplacian Threshold:")
        self.laplacian_value_label = QLabel()
        self.laplacian_threshold_slider = QSlider(Qt.Orientation.Horizontal)
        laplacian_layout.addWidget(laplacian_label)
        laplacian_layout.addWidget(self.laplacian_threshold_slider)
        laplacian_layout.addWidget(self.laplacian_value_label)
        control_layout.addLayout(laplacian_layout)

        # Block count controls
        block_layout = QHBoxLayout()
        block_label = QLabel("Blocks per side (2^n):")
        self.block_count_label = QLabel()
        self.block_count_slider = QSlider(Qt.Orientation.Horizontal)
        self.block_count_slider.setMinimum(0)  # 2^(0+3) = 8 blocks
        self.block_count_slider.setMaximum(4)  # 2^(4+3) = 128 blocks
        self.block_count_slider.setValue(1)  # 2^(1+3) = 16 blocks (default)
        block_layout.addWidget(block_label)
        block_layout.addWidget(self.block_count_slider)
        block_layout.addWidget(self.block_count_label)
        control_layout.addLayout(block_layout)

        # Transfer blocks button
        transfer_blocks_button = QPushButton("Transfer Blocks")
        control_layout.addWidget(transfer_blocks_button)

        # Add control panel to main layout
        layout.addWidget(control_panel)

        # Create status bar
        self.status_bar = QStatusBar(self)
        self.setStatusBar(self.status_bar)

        # Connect signals
        self.gradient_threshold_slider.valueChanged.connect(self.update_visualization)
        self.gradient_threshold_slider.valueChanged.connect(self.update_status_bar)
        self.laplacian_threshold_slider.valueChanged.connect(self.update_visualization)
        self.laplacian_threshold_slider.valueChanged.connect(self.update_status_bar)
        self.block_count_slider.valueChanged.connect(self.update_block_count_label)
        self.block_count_slider.valueChanged.connect(self.process_and_display_image)
        transfer_blocks_button.clicked.connect(self.transfer_blocks)

        # Set up event filter
        self.image_label.setMouseTracking(True)
        self.image_label.installEventFilter(self)

        # Initialize labels
        self.update_block_count_label(self.block_count_slider.value())
        self.update_status_bar()

    def get_block_count(self):
        return 1 << (self.block_count_slider.value() + 3)  # 2^(value+3)

    def analyze_image_blocks(self):
        self.block_metrics = []
        blocks = self.get_block_count()

        # Calculate block dimensions
        block_width = self.original_image.shape[1] // blocks
        block_height = self.original_image.shape[0] // blocks

        for y in range(blocks):
            for x in range(blocks):
                # Calculate block region
                start_x = x * block_width
                start_y = y * block_height
                width = (
                    self.original_image.shape[1] - start_x
                    if x == blocks - 1
                    else block_width
                )
                height = (
                    self.original_image.shape[0] - start_y
                    if y == blocks - 1
                    else block_height
                )

                block_region = (
                    slice(start_y, start_y + height),
                    slice(start_x, start_x + width),
                )

                # Extract block
                block = self.original_image[block_region]

                # Calculate gradient metrics
                gradient_sum = 0
                for channel in cv2.split(block):
                    grad_x = cv2.Sobel(channel, cv2.CV_64F, 1, 0)
                    grad_y = cv2.Sobel(channel, cv2.CV_64F, 0, 1)
                    magnitude = np.sqrt(grad_x**2 + grad_y**2)
                    gradient_sum += np.std(magnitude)

                # Calculate Laplacian variance
                gray = cv2.cvtColor(block, cv2.COLOR_BGR2GRAY)
                laplacian = cv2.Laplacian(gray, cv2.CV_64F)
                laplacian_arr = np.asarray(laplacian).astype(np.float32)
                laplacian_var = np.var(laplacian_arr)

                # Create metrics object
                metrics = BlockMetrics()
                metrics.gradient_mean = float(gradient_sum) / 3.0
                metrics.laplacian_var = float(laplacian_var)
                metrics.region = (start_x, start_y, width, height)
                self.block_metrics.append(metrics)

    def calculate_metrics_stats(self):
        if not self.block_metrics:
            return

        gradient_values = []
        laplacian_values = []
        self.metrics_stats = MetricsStats()

        for metrics in self.block_metrics:
            gradient_values.append(metrics.gradient_mean)
            laplacian_values.append(metrics.laplacian_var)

            # Update min/max
            self.metrics_stats.gradient_min = min(
                self.metrics_stats.gradient_min, metrics.gradient_mean
            )
            self.metrics_stats.gradient_max = max(
                self.metrics_stats.gradient_max, metrics.gradient_mean
            )
            self.metrics_stats.laplacian_min = min(
                self.metrics_stats.laplacian_min, metrics.laplacian_var
            )
            self.metrics_stats.laplacian_max = max(
                self.metrics_stats.laplacian_max, metrics.laplacian_var
            )

        # Calculate medians
        self.metrics_stats.gradient_median = float(np.median(gradient_values))
        self.metrics_stats.laplacian_median = float(np.median(laplacian_values))

        # Update sliders and labels
        self.gradient_threshold_slider.setMinimum(int(self.metrics_stats.gradient_min))
        self.gradient_threshold_slider.setMaximum(int(self.metrics_stats.gradient_max))
        self.gradient_threshold_slider.setValue(int(self.metrics_stats.gradient_median))
        self.update_gradient_label(int(self.metrics_stats.gradient_median))

        self.laplacian_threshold_slider.setMinimum(
            int(self.metrics_stats.laplacian_min)
        )
        self.laplacian_threshold_slider.setMaximum(
            int(self.metrics_stats.laplacian_max)
        )
        self.laplacian_threshold_slider.setValue(
            int(self.metrics_stats.laplacian_median)
        )
        self.update_laplacian_label(int(self.metrics_stats.laplacian_median))

        self.update_status_bar()

    def visualize_block_metrics(self, original):
        visualization = original.copy()
        gradient_threshold = self.gradient_threshold_slider.value()
        laplacian_threshold = self.laplacian_threshold_slider.value()

        # Process blocks
        self.lossless_blocks = []
        self.lossy_blocks = []
        for i, metrics in enumerate(self.block_metrics):
            if (
                metrics.gradient_mean < gradient_threshold
                or metrics.laplacian_var < laplacian_threshold
            ):
                iblock = IndexBlock()
                iblock.index = i
                iblock.metrics = metrics
                self.lossy_blocks.append(iblock)

                # Calculate metric excess percentages
                gradient_excess = (
                    (metrics.gradient_mean - gradient_threshold) / gradient_threshold
                    if gradient_threshold != 0
                    else 0
                )
                laplacian_excess = (
                    (metrics.laplacian_var - laplacian_threshold) / laplacian_threshold
                    if laplacian_threshold != 0
                    else 0
                )

                # Determine overlay color
                THRESHOLD_DIFF = 0.05
                if abs(gradient_excess - laplacian_excess) < THRESHOLD_DIFF:
                    overlay_color = (255, 0, 255)  # Purple
                elif gradient_excess > laplacian_excess:
                    overlay_color = (0, 0, 255)  # Red
                else:
                    overlay_color = (255, 0, 0)  # Blue

                # Apply overlay
                x, y, w, h = metrics.region
                overlay = visualization[y : y + h, x : x + w].copy()
                color_overlay = np.full((h, w, 3), overlay_color, dtype=np.uint8)
                alpha = 0.3
                cv2.addWeighted(color_overlay, alpha, overlay, 1.0 - alpha, 0, overlay)
                visualization[y : y + h, x : x + w] = overlay
            else:
                iblock = IndexBlock()
                iblock.index = i
                iblock.metrics = metrics
                self.lossless_blocks.append(iblock)

        # Draw grid
        blocks = self.get_block_count()
        block_width = visualization.shape[1] / blocks
        block_height = visualization.shape[0] / blocks

        # Draw horizontal lines
        for y in range(blocks + 1):
            line_y = int(y * block_height)
            if y == blocks:
                line_y = visualization.shape[0] - 1
            cv2.line(
                visualization,
                (0, line_y),
                (visualization.shape[1], line_y),
                (0, 0, 0),
                1,
            )

        # Draw vertical lines
        for x in range(blocks + 1):
            line_x = int(x * block_width)
            if x == blocks:
                line_x = visualization.shape[1] - 1
            cv2.line(
                visualization,
                (line_x, 0),
                (line_x, visualization.shape[0]),
                (0, 0, 0),
                1,
            )

        return visualization


    def draw_diff(self, img1: np.ndarray, img2: np.ndarray) -> np.ndarray:
        """
        Compares two images in 8x8 tiles and draws a blue box on differing tiles.
        
        Parameters:
            img1 (np.ndarray): First image as a NumPy array.
            img2 (np.ndarray): Second image as a NumPy array.
        
        Returns:
            np.ndarray: Image with blue boxes around differing tiles.
        """
        if img1.shape != img2.shape:
            raise ValueError("Images must have the same dimensions")
        
        # Copy the original image to draw on
        output_img = img1.copy()
        
        height, width, _ = img1.shape
        tile_size = 8
        
        for y in range(0, height, tile_size):
            for x in range(0, width, tile_size):
                roi1 = img1[y:y+tile_size, x:x+tile_size]
                roi2 = img2[y:y+tile_size, x:x+tile_size]
                
                if not np.array_equal(roi1, roi2):
                    cv2.rectangle(output_img, (x, y), (x + tile_size, y + tile_size), (255, 0, 0), 1)
        
        return output_img



    def transfer_blocks(self):
        original_image = self.original_image.copy()
        target_image = self.original_image.copy()

        res = fpga_accelerated_compressor.process_color_image(target_image)
        target_image = res.imgRGB

        original_image = cv2.cvtColor(original_image, cv2.COLOR_BGR2RGB)
        target_image = cv2.cvtColor(target_image, cv2.COLOR_BGR2RGB)

        for i, _ in enumerate(self.lossless_blocks):
            current = self.lossless_blocks[i]
            roi = None
            if current.metrics == None:
                return
            roi = current.metrics.region
            print(f"Region of Interest: {roi}")
            processed_block = original_image[
                roi[0] : roi[0] + roi[2], roi[1] : roi[1] + roi[3]
            ]
            target_image[roi[0] : roi[0] + roi[2], roi[1] : roi[1] + roi[3]] = (
                processed_block
            )

        drawn_image = self.draw_diff(original_image,  target_image)

        oheight, owidth, ochannels = original_image.shape
        obytes_per_line = ochannels * owidth

        theight, twidth, tchannels = target_image.shape
        tbytes_per_line = tchannels * twidth

        dheight, dwidth, dchannels = drawn_image.shape
        dbytes_per_line = dchannels * dwidth

        oimg = QImage(
            bytes(original_image.data),
            owidth,
            oheight,
            obytes_per_line,
            QImage.Format.Format_RGB888,
        )
        timg = QImage(
            bytes(target_image.data),
            twidth,
            theight,
            tbytes_per_line,
            QImage.Format.Format_RGB888,
        )
        dimg = QImage(
            bytes(drawn_image.data),
            owidth,
            oheight,
            obytes_per_line,
            QImage.Format.Format_RGB888,
        )

        pixmap1 = QPixmap(oimg)
        pixmap2 = QPixmap(timg)
        pixmap3 = QPixmap(dimg)

        # processed_size = target_image.shape*8
        # original_shape = f"{original_image.shape}"
        # processed_shape = f"{target_image.shape}"
        self.processed_window = ProcessedWindow(
            pixmap1,
            pixmap2,
            pixmap3,
            f"PSNR: {res.PSNR:.3f} MSSSIM: {res.MSSSIM:.3f} OG Size: {res.original_size//1024//1024} Compressed Size: {res.size_stats.compressed_size//1024//1024} Compression Ratio: {res.compression_ratio}",
        )
        self.processed_window.show()

    def update_visualization(self):
        if self.block_metrics:
            self.current_image = self.visualize_block_metrics(self.original_image)

            # Convert BGR to RGB for Qt
            rgb_image = cv2.cvtColor(self.current_image, cv2.COLOR_BGR2RGB)
            h, w, ch = rgb_image.shape
            bytes_per_line = ch * w
            qt_image = QImage(
                rgb_image.data, w, h, bytes_per_line, QImage.Format.Format_RGB888
            )

            # Scale to fit while preserving aspect ratio
            pixmap = QPixmap.fromImage(qt_image)
            scaled_pixmap = pixmap.scaled(
                self.image_label.size(),
                Qt.AspectRatioMode.KeepAspectRatio,
                Qt.TransformationMode.SmoothTransformation,
            )
            self.image_label.setPixmap(scaled_pixmap)

    def process_and_display_image(self):
        self.analyze_image_blocks()
        self.calculate_metrics_stats()
        self.update_visualization()

    def load_image_from_path(self, path):
        self.current_image_path = path
        self.original_image = cv2.imread(str(path))
        self.original_image = resize_image(self.original_image)
        if self.original_image is None:
            self.original_image = np.full((480, 640, 3), 128, dtype=np.uint8)
        self.process_and_display_image()

    def reload_image(self):
        if self.current_image_path:
            self.load_image_from_path(self.current_image_path)

    def update_gradient_label(self, value):
        self.gradient_value_label.setText(str(value))

    def update_laplacian_label(self, value):
        self.laplacian_value_label.setText(str(value))

    def update_status_bar(self):
        blocks = self.get_block_count()
        status = (
            f"Blocks: {blocks}x{blocks} | "
            f"Gradient Threshold: {self.gradient_threshold_slider.value()} | "
            f"Laplacian Threshold: {self.laplacian_threshold_slider.value()} | "
            f"Colors: Blue = Gradient dominant, "
            f"Red = Laplacian dominant, "
            f"Purple = Equal influence (±5%)"
        )
        self.status_bar.showMessage(status)

    def update_block_count_label(self, value):
        blocks = 1 << (value + 3)  # 2^(value+3)
        self.block_count_label.setText(f"{blocks} x {blocks}")

    def handle_mouse_click(self, event):
        if not self.block_metrics or self.current_image is None:
            print("Click ignored - no image or metrics available")
            return

        # Get the position in the scaled image
        pixmap = self.image_label.pixmap()
        if pixmap is None:
            print("Click ignored - no pixmap available")
            return

        # Get click position relative to label
        label_pos = event.pos()
        label_size = self.image_label.size()
        pixmap_size = pixmap.size()

        print(f"Click detected:")
        print(f"  Raw click position: {label_pos.x()}, {label_pos.y()}")
        print(f"  Label size: {label_size.width()}x{label_size.height()}")
        print(f"  Pixmap size: {pixmap_size.width()}x{pixmap_size.height()}")
        print(
            f"  Image size: {self.current_image.shape[1]}x{self.current_image.shape[0]}"
        )

        # Calculate the actual displayed image rect within the label
        label_aspect = label_size.width() / label_size.height()
        image_aspect = self.current_image.shape[1] / self.current_image.shape[0]

        if label_aspect > image_aspect:
            # Label is wider than image - image is height-constrained
            display_width = int(label_size.height() * image_aspect)
            x_offset = (label_size.width() - display_width) // 2
            display_rect = (x_offset, 0, display_width, label_size.height())
        else:
            # Label is taller than image - image is width-constrained
            display_height = int(label_size.width() / image_aspect)
            y_offset = (label_size.height() - display_height) // 2
            display_rect = (0, y_offset, label_size.width(), display_height)

        print(f"  Display rect: {display_rect}")

        # Check if click is within the display rect
        if not (
            display_rect[0] <= label_pos.x() <= display_rect[0] + display_rect[2]
            and display_rect[1] <= label_pos.y() <= display_rect[1] + display_rect[3]
        ):
            print("  Click outside image area")
            return

        # Convert click position to image coordinates
        scale_x = self.current_image.shape[1] / display_rect[2]
        scale_y = self.current_image.shape[0] / display_rect[3]

        img_x = int((label_pos.x() - display_rect[0]) * scale_x)
        img_y = int((label_pos.y() - display_rect[1]) * scale_y)

        # Clamp coordinates to image bounds
        img_x = max(0, min(img_x, self.current_image.shape[1] - 1))
        img_y = max(0, min(img_y, self.current_image.shape[0] - 1))

        print(f"  Image coordinates: {img_x}, {img_y}")

        # Find which block was clicked
        block_found = False
        for metrics in self.block_metrics:
            x, y, w, h = metrics.region
            if (x <= img_x < x + w) and (y <= img_y < y + h):
                block_found = True
                print(f"  Block found:")
                print(f"    Region: {x}, {y} {w}x{h}")
                print(f"    Gradient: {metrics.gradient_mean}")
                print(f"    Laplacian: {metrics.laplacian_var}")

                # Extract the block
                block = self.original_image[y : y + h, x : x + w].copy()

                # Create and show the block viewer
                viewer = BlockViewer(
                    block, metrics.gradient_mean, metrics.laplacian_var, self
                )
                viewer.setAttribute(Qt.WidgetAttribute.WA_DeleteOnClose)
                viewer.show()
                break

        if not block_found:
            print("  No block found at this position")

    def eventFilter(self, a0: QObject | None, a1: QEvent | None) -> bool:
        if a0 is None or a1 is None:
            return False

        if a0 == self.image_label:
            if a1.type() == QEvent.Type.MouseButtonPress:
                if (
                    isinstance(a1, QMouseEvent)
                    and a1.button() == Qt.MouseButton.LeftButton
                ):
                    self.handle_mouse_click(a1)
                    return True
            elif a1.type() == QEvent.Type.Resize:
                self.process_and_display_image()
                return True
        return super().eventFilter(a0, a1)

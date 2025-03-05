from PyQt6.QtWidgets import (
    QFileDialog,
    QMainWindow,
    QWidget,
    QVBoxLayout,
    QHBoxLayout,
    QLabel,
    QSlider,
    QPushButton,
    QScrollArea,
    QStatusBar,
    QSplitter,
)
from PyQt6.QtCore import QObject, Qt, QEvent
from PyQt6.QtGui import QPixmap, QImage, QPalette, QMouseEvent
import cv2
from cv2.typing import MatLike
import numpy as np
from numpy._core.multiarray import ndarray
from blockviewer import BlockViewer
import fpga_accelerated_compressor
from processedwindow import ProcessedWindow
import image_codec
from ZoomableImageLabel import ZoomableImageLabel


IMG_SIZE = 2048  # Size of image
TILE_SIZE = 32  # Size of the tiles that input 2048x2048 image will be split into
BLOCK_SIZE = 8  # Size of 8x8 DCT Blocks
N_BLOCKS = TILE_SIZE // BLOCK_SIZE
N_TILES = IMG_SIZE // TILE_SIZE


class BlockMetrics:
    def __init__(self):
        self.gradient_mean = 0.0
        self.laplacian_var = 0.0
        self.loc = (0, 0)
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


class ProcessedWindow(QMainWindow):
    def __init__(self, original_pixmap, processed_pixmap, diff_pixmap, info_text, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Processed Images")
        self.resize(1200, 600)
        
        # Create central widget
        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        main_layout = QVBoxLayout(central_widget)
        
        # Create a splitter for resizable sections
        splitter = QSplitter(Qt.Orientation.Horizontal)
        main_layout.addWidget(splitter)
        
        # Create containers for the three images
        original_container = QWidget()
        processed_container = QWidget()
        diff_container = QWidget()
        
        # Set up layouts for each container
        original_layout = QVBoxLayout(original_container)
        processed_layout = QVBoxLayout(processed_container)
        diff_layout = QVBoxLayout(diff_container)
        
        # Create labels for titles
        original_label = QLabel("Original Image")
        original_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        processed_label = QLabel("Processed Image")
        processed_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        diff_label = QLabel("Difference Visualization")
        diff_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        # Create zoomable image labels
        self.original_image = ZoomableImageLabel()
        self.processed_image = ZoomableImageLabel()
        self.diff_image = ZoomableImageLabel()
        
        # Set pixmaps to the zoomable labels
        self.original_image.set_pixmap(original_pixmap)
        self.processed_image.set_pixmap(processed_pixmap)
        self.diff_image.set_pixmap(diff_pixmap)
        
        # Create reset zoom buttons
        original_reset_btn = QPushButton("Reset Zoom")
        original_reset_btn.clicked.connect(self.original_image.reset_zoom)
        
        processed_reset_btn = QPushButton("Reset Zoom")
        processed_reset_btn.clicked.connect(self.processed_image.reset_zoom)
        
        diff_reset_btn = QPushButton("Reset Zoom")
        diff_reset_btn.clicked.connect(self.diff_image.reset_zoom)
        
        # Create info label
        info_label = QLabel(info_text)
        info_label.setAlignment(Qt.AlignmentFlag.AlignLeft | Qt.AlignmentFlag.AlignTop)
        info_label.setWordWrap(True)
        
        # Add widgets to layouts
        original_layout.addWidget(original_label)
        original_layout.addWidget(self.original_image)
        original_layout.addWidget(original_reset_btn)
        
        processed_layout.addWidget(processed_label)
        processed_layout.addWidget(self.processed_image)
        processed_layout.addWidget(processed_reset_btn)
        
        diff_layout.addWidget(diff_label)
        diff_layout.addWidget(self.diff_image)
        diff_layout.addWidget(diff_reset_btn)
        
        # Add containers to splitter
        splitter.addWidget(original_container)
        splitter.addWidget(processed_container)
        splitter.addWidget(diff_container)
        
        # Add info label to main layout
        main_layout.addWidget(info_label)
        
        # Set up synchronous zooming between images
        self.sync_zoom = True  # Flag to enable/disable synchronous zooming
        
        # Add a button to toggle synchronous zooming
        sync_button = QPushButton("Toggle Sync Zoom (Currently ON)")
        sync_button.clicked.connect(self.toggle_sync_zoom)
        main_layout.addWidget(sync_button)
        self.sync_button = sync_button
        
        # Add instructions
        instructions = QLabel("Zoom: Mouse Wheel | Pan: Middle Mouse Button + Drag")
        instructions.setAlignment(Qt.AlignmentFlag.AlignCenter)
        main_layout.addWidget(instructions)
        
    def toggle_sync_zoom(self):
        """Toggle synchronous zooming between the three images"""
        self.sync_zoom = not self.sync_zoom
        button_text = "Toggle Sync Zoom (Currently ON)" if self.sync_zoom else "Toggle Sync Zoom (Currently OFF)"
        self.sync_button.setText(button_text)


class MainWindow(QMainWindow):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setup_ui()
        # Create initial blank image
        self.original_image = np.full((IMG_SIZE, IMG_SIZE, 3), 128, dtype=np.uint8)
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

        # Create zoomable image label (instead of regular QLabel)
        self.image_label = ZoomableImageLabel()
        self.image_label.setMinimumSize(640, 480)
        self.image_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.scroll_area.setWidget(self.image_label)

        # Add reset zoom button
        reset_zoom_button = QPushButton("Reset Zoom")
        reset_zoom_button.clicked.connect(self.reset_zoom)

        # Create control panel
        control_panel = QWidget()
        control_layout = QVBoxLayout(control_panel)
        
        # Add reset zoom button to control panel
        control_layout.addWidget(reset_zoom_button)

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
        self.block_count_slider.setValue(3)  # 2^(1+3) = 16 blocks (default)
        block_layout.addWidget(block_label)
        block_layout.addWidget(self.block_count_slider)
        block_layout.addWidget(self.block_count_label)
        control_layout.addLayout(block_layout)

        # Select Image Button
        select_image_button = QPushButton("Select Image")
        control_layout.addWidget(select_image_button)

        # Transfer blocks button
        transfer_blocks_button = QPushButton("Transfer Blocks")
        control_layout.addWidget(transfer_blocks_button)

        # Add zoom instructions
        zoom_instructions = QLabel("Zoom: Mouse Wheel | Pan: Middle Mouse Button + Drag")
        zoom_instructions.setAlignment(Qt.AlignmentFlag.AlignCenter)
        control_layout.addWidget(zoom_instructions)

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
        select_image_button.clicked.connect(self.open_image)

        # Set up event filter for mouse clicks
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

        # Convert image to grayscale and 2d numpy array
        image_gray = cv2.cvtColor(self.original_image, cv2.COLOR_BGR2GRAY)
        image_gray = np.asarray(image_gray).astype(np.float32)
        print(f"Image shape: {image_gray.shape}")
        blocks = image_codec.generate_tiles(image_gray, TILE_SIZE)

        for row in range(blocks.shape[0]):
            for col in range(blocks.shape[1]):
                # Calculate gradient metrics
                grad_x = cv2.Sobel(blocks[row][col], cv2.CV_32F, 1, 0)
                grad_y = cv2.Sobel(blocks[row][col], cv2.CV_32F, 0, 1)
                magnitude = np.sqrt(grad_x**2 + grad_y**2)
                gradient_std_val = np.std(magnitude)


                # Calculate Laplacian variance
                laplacian = cv2.Laplacian(blocks[row][col], cv2.CV_32F)
                laplacian_arr = np.asarray(laplacian).astype(np.float32)
                laplacian_var = np.var(laplacian_arr)

                # Create metrics object
                metrics = BlockMetrics()
                metrics.gradient_mean = np.mean(gradient_std_val)
                metrics.laplacian_var = laplacian_var
                metrics.loc = (row, col)
                self.block_metrics.append(metrics)

        '''for y in range(blocks):
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

                # convert block to grayscale
                block = cv2.cvtColor(block, cv2.COLOR_BGR2GRAY)

                # Calculate gradient metrics
                grad_x = cv2.Sobel(block, cv2.CV_64F, 1, 0)
                grad_y = cv2.Sobel(block, cv2.CV_64F, 0, 1)
                magnitude = np.sqrt(grad_x**2 + grad_y**2)
                gradient_std_val = np.std(magnitude)


                # Calculate Laplacian variance
                laplacian = cv2.Laplacian(block, cv2.CV_64F)
                laplacian_arr = np.asarray(laplacian).astype(np.float32)
                laplacian_var = np.var(laplacian_arr)

                # Create metrics object
                metrics = BlockMetrics()
                metrics.gradient_mean = np.mean(gradient_std_val)
                metrics.laplacian_var = laplacian_var
                metrics.region = (start_x, start_y, width, height)
                self.block_metrics.append(metrics)'''

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
        visualization = image_codec.generate_tiles(original, TILE_SIZE)
        gradient_threshold = self.gradient_threshold_slider.value()
        laplacian_threshold = self.laplacian_threshold_slider.value()

        # Process blocks
        self.lossless_blocks = []
        self.lossy_blocks = []
        self.block_ids = np.zeros(4096)
        for i, metrics in enumerate(self.block_metrics):
            # CHANGED: Reversed the logic to highlight blocks ABOVE thresholds
            # instead of below thresholds
            iblock = IndexBlock()
            iblock.index = i
            iblock.metrics = metrics
            
            # Determine overlay color
            if (metrics.gradient_mean < gradient_threshold) and (metrics.laplacian_var > laplacian_threshold):
                overlay_color = (255, 0, 255)  # Purple - Both thresholds exceeded
                self.block_ids[i] = 1
                self.lossy_blocks.append(iblock)
            elif metrics.gradient_mean < gradient_threshold:
                overlay_color = (0, 0, 255)  # Blue - Gradient threshold exceeded
                self.block_ids[i] = 1
                self.lossy_blocks.append(iblock)
            elif metrics.laplacian_var > laplacian_threshold:
                overlay_color = (255, 0, 0)  # Red - Laplacian threshold exceeded
                self.block_ids[i] = 1
                self.lossy_blocks.append(iblock)
            else:
                overlay_color = (0, 0, 0)  # No highlight
                self.block_ids[i] = 0
                self.lossless_blocks.append(iblock)
                continue  # Skip applying overlay for lossless blocks

            # Apply overlay
            x, y = metrics.loc
            overlay = visualization[y][x].copy()
            color_overlay = np.full((32, 32, 3), overlay_color, dtype=np.uint8)
            alpha = 0.3
            cv2.addWeighted(color_overlay, alpha, overlay, 1.0 - alpha, 0, overlay)
            visualization[y][x] = overlay
            '''x, y, w, h = metrics.region
            overlay = visualization[y : y + h, x : x + w].copy()
            color_overlay = np.full((h, w, 3), overlay_color, dtype=np.uint8)
            alpha = 0.3
            cv2.addWeighted(color_overlay, alpha, overlay, 1.0 - alpha, 0, overlay)
            visualization[y : y + h, x : x + w] = overlay'''

        # convert visualization matrix to 2d & Draw grid
        visualization = visualization.reshape(IMG_SIZE, IMG_SIZE, 3)
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

        tile_size = 32

        block2d = self.block_ids.reshape((64, 64))
        for row in range(block2d.shape[0]):
            for col in range(block2d.shape[1]):
                if block2d[row][col] == 1:

                    # Apply overlay
                    w = 32
                    h = 32
                    x = col * w
                    y = row * h
                    overlay_color = (255, 0, 1)  # Purple
                    overlay = output_img[y : y + h, x : x + w].copy()
                    color_overlay = np.full((h, w, 3), overlay_color, dtype=np.uint8)
                    alpha = 0.3
                    cv2.addWeighted(
                        color_overlay, alpha, overlay, 1.0 - alpha, 0, overlay
                    )
                    output_img[y : y + h, x : x + w] = overlay
                    cv2.rectangle(
                        output_img,
                        (col * 32, row * 32),
                        (col * 32 + tile_size, row * 32 + tile_size),
                        (255, 0, 0),
                        1,
                    )

        return output_img

    def open_image(self):
        filename, _ = QFileDialog.getOpenFileName(self, "Select Image", ".", "Image Files (*.png, *.jpg)")
        print(f"Selected Image {filename}")
        self.load_image_from_path(filename)

    def transfer_blocks(self):
        original_image = self.original_image.copy()
        target_image = self.original_image.copy()

        res = fpga_accelerated_compressor.process_color_image(
            target_image, self.block_ids
        )
        target_image = res.imgRGB

        print(f"Num Compressed Blocks: {res.size_stats.compressed_blocks}")
        print(f"Num Lossless Blocks: {res.size_stats.uncompressed_blocks}")
        print(f"Total Size: {res.size_stats.total_size}KB")
        print(f"Compressed Size: {res.size_stats.compressed_size}KB")
        print(f"Uncompressed Size: {res.size_stats.uncompressed_size}KB")
        print(f"Original Size: {res.original_size}KB")
        print(f"Compression Ratio: {res.compression_ratio}%")

        original_image = cv2.cvtColor(original_image, cv2.COLOR_BGR2RGB)
        target_image = cv2.cvtColor(target_image, cv2.COLOR_BGR2RGB)

        drawn_image = self.draw_diff(original_image, target_image)

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
            dwidth,
            dheight,
            dbytes_per_line,
            QImage.Format.Format_RGB888,
        )

        pixmap1 = QPixmap(oimg)
        pixmap2 = QPixmap(timg)
        pixmap3 = QPixmap(dimg)

        self.processed_window = ProcessedWindow(
            pixmap1,
            pixmap2,
            pixmap3,
            f"""PSNR: {res.PSNR:.3f}
MSSSIM: {res.MSSSIM:.3f}
OG Size: {res.original_size}KB
Final Compressed Size: {res.size_stats.total_size:.2f}KB
Compression Ratio: {res.compression_ratio:.2f}
Compressed Blocks: {res.size_stats.compressed_blocks}
Uncompressed Blocks: {res.size_stats.uncompressed_blocks}
""",
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

            # Set the pixmap to our zoomable label
            pixmap = QPixmap.fromImage(qt_image)
            self.image_label.set_pixmap(pixmap)

    def reset_zoom(self):
        self.image_label.reset_zoom()

    def process_and_display_image(self):
        self.analyze_image_blocks()
        self.calculate_metrics_stats()
        self.update_visualization()

    def load_image_from_path(self, path):
        self.current_image_path = path
        self.original_image = cv2.imread(str(path))
        self.original_image = cv2.cvtColor(self.original_image, cv2.COLOR_RGBA2RGB)
        self.original_image = image_codec.resize_image(self.original_image, IMG_SIZE)
        if self.original_image is None:
            self.original_image = np.full((IMG_SIZE, IMG_SIZE, 3), 128, dtype=np.uint8)
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

        # Get the original pixmap from our zoomable label
        pixmap = self.image_label.original_pixmap
        if pixmap is None:
            print("Click ignored - no pixmap available")
            return

        # Get click position relative to the image after accounting for zoom
        label_pos = event.pos()
        
        # Adjust click position based on the zoomable label's offset and scale
        adjusted_x = (label_pos.x() - self.image_label.offset.x()) / self.image_label.scale_factor
        adjusted_y = (label_pos.y() - self.image_label.offset.y()) / self.image_label.scale_factor
        
        # Convert to image coordinates
        img_x = int(adjusted_x)
        img_y = int(adjusted_y)
        
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

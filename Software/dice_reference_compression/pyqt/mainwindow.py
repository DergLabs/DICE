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
from file_format import read_dice_file
import fpga_accelerated_compressor
from processedwindow import ProcessedWindow
import image_codec
from ZoomableImageLabel import ZoomableImageLabel
import os


IMG_SIZE = 2048  # Size of image
TILE_SIZE = 32  # Size of the tiles that input 2048x2048 image will be split into
BLOCK_SIZE = 8  # Size of 8x8 DCT Blocks
N_TILES = IMG_SIZE // TILE_SIZE


class ImageWindow(QMainWindow):
    def __init__(self, q_image: QImage):
        super().__init__()
        self.setWindowTitle("DICE Image")
        
        # Create image label
        self.image_label = QLabel(self)
        self.setCentralWidget(self.image_label)
        
        # Convert QImage to QPixmap and display it
        pixmap = QPixmap.fromImage(q_image)
        self.image_label.setPixmap(pixmap)
        self.resize(pixmap.width(), pixmap.height())

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
        
        # Create scroll areas to contain the zoomable images
        original_scroll = QScrollArea()
        original_scroll.setWidgetResizable(True)
        original_scroll.setBackgroundRole(QPalette.ColorRole.Dark)
        
        processed_scroll = QScrollArea()
        processed_scroll.setWidgetResizable(True)
        processed_scroll.setBackgroundRole(QPalette.ColorRole.Dark)
        
        diff_scroll = QScrollArea()
        diff_scroll.setWidgetResizable(True)
        diff_scroll.setBackgroundRole(QPalette.ColorRole.Dark)
        
        # Create zoomable image labels
        self.original_image = ZoomableImageLabel()
        self.processed_image = ZoomableImageLabel()
        self.diff_image = ZoomableImageLabel()
        
        # Make sure the labels have a minimum size to prevent collapse
        self.original_image.setMinimumSize(200, 150)
        self.processed_image.setMinimumSize(200, 150)
        self.diff_image.setMinimumSize(200, 150)
        
        # Set pixmaps to the zoomable labels
        self.original_image.set_pixmap(original_pixmap)
        self.processed_image.set_pixmap(processed_pixmap)
        self.diff_image.set_pixmap(diff_pixmap)
        
        # Add the labels to the scroll areas
        original_scroll.setWidget(self.original_image)
        processed_scroll.setWidget(self.processed_image)
        diff_scroll.setWidget(self.diff_image)
        
        # Create reset zoom buttons
        original_reset_btn = QPushButton("Reset Zoom")
        original_reset_btn.clicked.connect(self.reset_all_zoom)
        
        processed_reset_btn = QPushButton("Reset Zoom")
        processed_reset_btn.clicked.connect(self.reset_all_zoom)
        
        diff_reset_btn = QPushButton("Reset Zoom")
        diff_reset_btn.clicked.connect(self.reset_all_zoom)
        
        # Create info label
        info_label = QLabel(info_text)
        info_label.setAlignment(Qt.AlignmentFlag.AlignLeft | Qt.AlignmentFlag.AlignTop)
        info_label.setWordWrap(True)
        
        # Add widgets to layouts
        original_layout.addWidget(original_label)
        original_layout.addWidget(original_scroll)
        original_layout.addWidget(original_reset_btn)
        
        processed_layout.addWidget(processed_label)
        processed_layout.addWidget(processed_scroll)
        processed_layout.addWidget(processed_reset_btn)
        
        diff_layout.addWidget(diff_label)
        diff_layout.addWidget(diff_scroll)
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
        
        # Connect zoom events if sync is enabled
        self.connect_sync_zoom()
            
    def connect_sync_zoom(self):
        """Connect zoom events between the three images"""
        # Disconnect any existing connections to avoid duplicates
        self.disconnect_sync_zoom()
        
        if self.sync_zoom:
            # Connect original image signals to the other two
            self.original_image.zoomChanged.connect(
                lambda scale, offset: self.processed_image.set_zoom(scale, offset)
            )
            self.original_image.zoomChanged.connect(
                lambda scale, offset: self.diff_image.set_zoom(scale, offset)
            )
            self.original_image.panChanged.connect(
                lambda offset: self.processed_image.set_zoom(
                    self.processed_image.scale_factor, offset
                )
            )
            self.original_image.panChanged.connect(
                lambda offset: self.diff_image.set_zoom(
                    self.diff_image.scale_factor, offset
                )
            )
            
            # Connect processed image signals to the other two
            self.processed_image.zoomChanged.connect(
                lambda scale, offset: self.original_image.set_zoom(scale, offset)
            )
            self.processed_image.zoomChanged.connect(
                lambda scale, offset: self.diff_image.set_zoom(scale, offset)
            )
            self.processed_image.panChanged.connect(
                lambda offset: self.original_image.set_zoom(
                    self.original_image.scale_factor, offset
                )
            )
            self.processed_image.panChanged.connect(
                lambda offset: self.diff_image.set_zoom(
                    self.diff_image.scale_factor, offset
                )
            )
            
            # Connect diff image signals to the other two
            self.diff_image.zoomChanged.connect(
                lambda scale, offset: self.original_image.set_zoom(scale, offset)
            )
            self.diff_image.zoomChanged.connect(
                lambda scale, offset: self.processed_image.set_zoom(scale, offset)
            )
            self.diff_image.panChanged.connect(
                lambda offset: self.original_image.set_zoom(
                    self.original_image.scale_factor, offset
                )
            )
            self.diff_image.panChanged.connect(
                lambda offset: self.processed_image.set_zoom(
                    self.processed_image.scale_factor, offset
                )
            )
    
    def disconnect_sync_zoom(self):
        """Disconnect all zoom event connections"""
        try:
            # Disconnect all signals - use try/except to safely handle when no connections exist
            try:
                self.original_image.zoomChanged.disconnect()
            except TypeError:
                pass  # No connections to disconnect
                
            try:
                self.original_image.panChanged.disconnect()
            except TypeError:
                pass
                
            try:
                self.processed_image.zoomChanged.disconnect()
            except TypeError:
                pass
                
            try:
                self.processed_image.panChanged.disconnect()
            except TypeError:
                pass
                
            try:
                self.diff_image.zoomChanged.disconnect()
            except TypeError:
                pass
                
            try:
                self.diff_image.panChanged.disconnect()
            except TypeError:
                pass
        except Exception as e:
            # In case of any other unexpected errors
            print(f"Error during signal disconnection: {e}")
        
    def toggle_sync_zoom(self):
        """Toggle synchronous zooming between the three images"""
        self.sync_zoom = not self.sync_zoom
        button_text = "Toggle Sync Zoom (Currently ON)" if self.sync_zoom else "Toggle Sync Zoom (Currently OFF)"
        self.sync_button.setText(button_text)
        
        if self.sync_zoom:
            self.connect_sync_zoom()
        else:
            self.disconnect_sync_zoom()
    
    def reset_all_zoom(self):
        """Reset zoom for all three images"""
        # Only need to reset one image if sync is on
        if self.sync_zoom:
            self.original_image.reset_zoom()
        else:
            self.original_image.reset_zoom()
            self.processed_image.reset_zoom()
            self.diff_image.reset_zoom()


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

        # Open DICE Encoded Image
        open_saved_image_button = QPushButton("Open DICE Image")
        control_layout.addWidget(open_saved_image_button)

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
        open_saved_image_button.clicked.connect(self.open_saved_image)
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

        # Convert image to grayscale 
        img_merged = cv2.merge([self.original_image[:,:,0], self.original_image[:,:,1], self.original_image[:,:,2]])
        image_gray = cv2.cvtColor(img_merged, cv2.COLOR_BGR2GRAY).astype(np.int16)
        #print(f"Grayscale Image shape: {image_gray.shape}")
        #generate tiled image
        tiles = image_codec.generate_tiles(image_gray, TILE_SIZE)
        #print(f"tiles shape: {tiles.shape}")

        for row in range(tiles.shape[0]):
            for col in range(tiles.shape[1]):
                # Calculate gradient metrics
                grad_x = cv2.Sobel(tiles[row][col], cv2.CV_32F, 1, 0)
                grad_y = cv2.Sobel(tiles[row][col], cv2.CV_32F, 0, 1)
                magnitude = np.sqrt(grad_x**2 + grad_y**2)
                gradient_std_val = np.std(magnitude)


                # Calculate Laplacian variance
                laplacian = cv2.Laplacian(tiles[row][col], cv2.CV_32F)
                laplacian_arr = np.asarray(laplacian).astype(np.float32)
                laplacian_var = np.var(laplacian_arr)

                # Create metrics object
                metrics = BlockMetrics()
                metrics.gradient_mean = np.mean(gradient_std_val)
                metrics.laplacian_var = laplacian_var
                metrics.loc = (row, col)
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


    def visualize_block_metrics(self):
        # Get the 5D visualization array (64x64x32x32x3)
        visualization = image_codec.generate_tiles(self.original_image, TILE_SIZE)
        #print(f"Visualization shape: {visualization.shape}")
        
        gradient_threshold = self.gradient_threshold_slider.value()
        laplacian_threshold = self.laplacian_threshold_slider.value()
        
        # Initialize block tracking
        self.lossless_blocks = []
        self.lossy_blocks = []
        self.block_ids = np.zeros(N_TILES*N_TILES)  # Changed from 4096 to 64*64 to match 64x64 grid
        
        #print(f"# of Block Metrics: {len(self.block_metrics)}")
        
        # Process each block metric and prepare the classification
        colored_blocks = []  # List to store [row, col, color] for blocks that need highlighting
        
        for i, metrics in enumerate(self.block_metrics):
            iblock = IndexBlock()
            iblock.index = i
            iblock.metrics = metrics
            
            # Get block coordinates from the metrics (already stored as row, col)
            row, col = metrics.loc
            
            # Determine overlay color based on thresholds
            if (metrics.gradient_mean < gradient_threshold) and (metrics.laplacian_var < laplacian_threshold):
                overlay_color = (255, 0, 255)  # Purple - Both thresholds exceeded
                self.block_ids[i] = 1
                self.lossy_blocks.append(iblock)
                colored_blocks.append((row, col, overlay_color))
            elif metrics.gradient_mean < gradient_threshold:
                overlay_color = (255, 0, 0)  # Blue - Gradient threshold exceeded
                self.block_ids[i] = 1
                self.lossy_blocks.append(iblock)
                colored_blocks.append((row, col, overlay_color))
            elif metrics.laplacian_var < laplacian_threshold:
                overlay_color = (0, 0, 255)  # Red - Laplacian threshold exceeded
                self.block_ids[i] = 1
                self.lossy_blocks.append(iblock)
                colored_blocks.append((row, col, overlay_color))
            else:
                self.block_ids[i] = 0
                self.lossless_blocks.append(iblock)
        
        # Create a copy of the visualization for applying highlights
        # This ensures we're always starting from the original image for each overlay
        visualization_with_highlights = visualization.copy()
        
        # Apply the overlay with proper transparency
        alpha = 0.3  # 30% opacity
        for row, col, color in colored_blocks:
            # Create overlay with the specific color
            color_overlay = np.full((32, 32, 3), color, dtype=np.uint8)
            
            # Apply overlay using addWeighted for proper alpha blending
            # This applies the overlay directly to the original tile, not to an already modified one
            cv2.addWeighted(
                color_overlay, alpha,
                visualization_with_highlights[row, col], 1.0 - alpha,
                0, visualization_with_highlights[row, col]
            )
        
        # Reshape the 5D visualization to 2D (2048x2048x3)
        reshaped = np.zeros((IMG_SIZE, IMG_SIZE, 3), dtype=np.uint8)
        
        for i in range(visualization_with_highlights.shape[0]):
            for j in range(visualization_with_highlights.shape[1]):
                y_start = i * 32
                y_end = (i + 1) * 32
                x_start = j * 32
                x_end = (j + 1) * 32
                
                reshaped[y_start:y_end, x_start:x_end] = visualization_with_highlights[i, j]
        
        # Draw grid on the reshaped image
        blocks = N_TILES  # We have a 64x64 grid
        block_width = reshaped.shape[1] / blocks
        block_height = reshaped.shape[0] / blocks
        
        # Draw horizontal lines
        for y in range(blocks + 1):
            line_y = int(y * block_height)
            if y == blocks:
                line_y = reshaped.shape[0] - 1
            cv2.line(
                reshaped,
                (0, line_y),
                (reshaped.shape[1], line_y),
                (0, 0, 0),
                1,
            )
        
        # Draw vertical lines
        for x in range(blocks + 1):
            line_x = int(x * block_width)
            if x == blocks:
                line_x = reshaped.shape[1] - 1
            cv2.line(
                reshaped,
                (line_x, 0),
                (line_x, reshaped.shape[0]),
                (0, 0, 0),
                1,
            )
        
        return reshaped


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


    def open_saved_image(self):
        filename, _ = QFileDialog.getOpenFileName(self, "Select DICE Encoded Image", ".", "DICE Image files (*.dice)")
        df = read_dice_file(filename)
        
        # Decode
        # # data = bytes(image_data)
        # oimg = QImage(
        #     bytes(original_image.data),
        #     df.main_header.dim_x,
        #     df.main_header.dim_y,
        #     obytes_per_line,
        #     QImage.Format.Format_RGB888,
        # )
        self.image_window = ImageWindow(QImage("REPLACE THIS WITH `oimg`"))
        self.image_window.show()

    def transfer_blocks(self):
        original_image = self.original_image.copy()
        target_image = self.original_image.copy()

        res = fpga_accelerated_compressor.process_color_image(
            target_image, self.block_ids
        )
        target_image = res.imgRGB

        file_size = os.path.getsize(self.current_image_path)/1024;
        file_compression_ratio = 100 * (1 - (res.size_stats.total_size / file_size))

        lossy_tile_size = res.size_stats.compressed_size / res.size_stats.compressed_blocks
        lossy_tile_compression_ratio = 100 * (1 - (lossy_tile_size / ((TILE_SIZE*TILE_SIZE*3)/1024)))

        lossless_tile_size = res.size_stats.uncompressed_size / res.size_stats.uncompressed_blocks
        lossless_tile_compresion_ratio = 100 * (1 - (lossless_tile_size / ((TILE_SIZE*TILE_SIZE*3)/1024)))

        print(f"Num Lossy Tiles: {res.size_stats.compressed_blocks}")
        print(f"Num Lossless Tiles: {res.size_stats.uncompressed_blocks}\n")

        print(f"Lossy Tiles Total Size: {res.size_stats.compressed_size:.2f}KB")
        print(f"Size of Individual Lossy Tile: {lossy_tile_size:.2f}KB")
        print(f"Lossy Tile Compression Ratio: {lossy_tile_compression_ratio:.2f}%\n")

        print(f"Lossless Tiles Total Size: {res.size_stats.uncompressed_size:.2f}KB")
        print(f"Size of Individual Uncompressed Tile: {lossless_tile_size:.2f}KB")
        print(f"Lossless Tile Compression Ratio: {lossless_tile_compresion_ratio:.2f}%\n")

        print(f"Total Processed Image Size: {res.size_stats.total_size:.2f}KB")
        print(f"Raw Image Size: {res.original_size:.2f}KB")
        print(f"Image File Size: {file_size:.2f}KB")
        print(f"Compression Ratio (Raw vs Compressed): {res.compression_ratio:.2f}%")
        print(f"Compression Ratio (Original vs Compressed): {file_compression_ratio:.2f}%")


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

Raw Image Size: {res.original_size:.2f}KB
Original Image File Size: {file_size:.2f}KB
Final Compressed Image Size: {res.size_stats.total_size:.2f}KB
Compression Ratio (Raw vs Compressed): {res.compression_ratio:.2f}%
Compression Ratio (Original vs Compressed): {file_compression_ratio:.2f}%

Num Lossy Tiles: {res.size_stats.compressed_blocks}
Total Lossy Tile Size: {res.size_stats.compressed_size:.2f}KB
Lossy Tile Size: {lossy_tile_size:.2f}KB
Lossy Tile Compression Ratio: {lossy_tile_compression_ratio:.2f}%

Num Lossless Tiles: {res.size_stats.uncompressed_blocks}
Total Lossless Tile Size: {res.size_stats.uncompressed_size:.2f}KB
Lossless Tile Size: {lossless_tile_size:.2f}KB
Lossless Tile Compression Ratio: {lossless_tile_compresion_ratio:.2f}%
""",
        )
        self.processed_window.show()


    def update_visualization(self):
        if self.block_metrics:
            self.current_image = self.visualize_block_metrics()

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


    def open_image(self):
        filename, _ = QFileDialog.getOpenFileName(self, "Select Image", ".", "Image Files (*)")
        print(f"Selected Image {filename}")
        self.load_image_from_path(filename)

        
    def load_image_from_path(self, path):
        self.current_image_path = path
        self.original_image = cv2.imread(str(path))
        self.original_image = cv2.cvtColor(self.original_image, cv2.COLOR_RGBA2RGB)
        # Resize to 2048x2048
        self.original_image = image_codec.resize_image(self.original_image, IMG_SIZE)
        # Create placeholder array with all values set to 128 if no image loaded
        if self.original_image is None:
            self.original_image = np.full((IMG_SIZE, IMG_SIZE, 3), 128, dtype=np.uint8)
        print(f"Loaded image with shape: {self.original_image.shape}")
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
            f"Tile Grid: {blocks}x{blocks} | "
            f"Tile Size: {TILE_SIZE}x{TILE_SIZE} | "
            f"Image Size: {IMG_SIZE}x{IMG_SIZE} | "
            f"Gradient Threshold: {self.gradient_threshold_slider.value()} | "
            f"Laplacian Threshold: {self.laplacian_threshold_slider.value()} | "
            f"Colors: Blue = Gradient > Threshold, "
            f"Red = Laplacian > Threshold, "
            f"Purple = Both > Threshold"
        )
        self.status_bar.showMessage(status)


    def update_block_count_label(self, value):
        blocks = 1 << (value + 3)  # 2^(value+3)
        self.block_count_label.setText(f"{blocks} x {blocks}")


    def handle_mouse_click(self, event):
        if not self.block_metrics or self.current_image is None:
            print("Click ignored - no image or metrics available")
            return

        print("\n--- Mouse Click Event ---")
        print(f"Click at screen position: {event.pos().x()}, {event.pos().y()}")
        
        # Get current view state
        print(f"Current widget size: {self.image_label.width()}x{self.image_label.height()}")
        if hasattr(self.image_label, 'scale_factor'):
            print(f"Current scale factor: {self.image_label.scale_factor}")
        if hasattr(self.image_label, 'offset'):
            print(f"Current offset: {self.image_label.offset.x()}, {self.image_label.offset.y()}")
        
        # Get image coordinates
        img_coords = self.image_label.map_to_image_coordinates(event.pos())
        if img_coords is None:
            print("Click coordinates outside the image area")
            return
        
        img_x, img_y = img_coords
        print(f"Mapped to image coordinates: {img_x:.0f}, {img_y:.0f}")
        
        # Convert to tile coordinates
        col = img_x // TILE_SIZE
        row = img_y // TILE_SIZE
        
        print(f"Tile coordinates: row={row}, col={col}")
        
        # Calculate the actual pixel region for this tile
        tile_x = col * TILE_SIZE
        tile_y = row * TILE_SIZE
        
        # Safety check for boundaries
        if (tile_y + TILE_SIZE > self.original_image.shape[0] or 
            tile_x + TILE_SIZE > self.original_image.shape[1]):
            print(f"Tile at row={row}, col={col} exceeds image boundaries")
            # Try to adjust to a valid tile
            col = min(col, (self.original_image.shape[1] // TILE_SIZE) - 1)
            row = min(row, (self.original_image.shape[0] // TILE_SIZE) - 1)
            tile_x = col * TILE_SIZE
            tile_y = row * TILE_SIZE
            print(f"Adjusted to valid tile at row={row}, col={col}")
        
        # Extract the block
        block = self.original_image[tile_y:tile_y+TILE_SIZE, tile_x:tile_x+TILE_SIZE].copy()
        
        # Find matching metrics
        found_metrics = False
        for i, metrics in enumerate(self.block_metrics):
            metric_row, metric_col = metrics.loc
            if metric_row == row and metric_col == col:
                print(f"Found metrics #{i} for block at {row},{col}")
                print(f"  Gradient: {metrics.gradient_mean:.2f}")
                print(f"  Laplacian: {metrics.laplacian_var:.2f}")
                
                # Create and show the block viewer
                viewer = BlockViewer(
                    block, metrics.gradient_mean, metrics.laplacian_var, self
                )
                viewer.setAttribute(Qt.WidgetAttribute.WA_DeleteOnClose)
                viewer.show()
                found_metrics = True
                break
        
        if not found_metrics:
            print(f"No metrics found for block at {row},{col}")
            # Still show the block with default metrics
            viewer = BlockViewer(block, 0.0, 0.0, self)
            viewer.setAttribute(Qt.WidgetAttribute.WA_DeleteOnClose)
            viewer.show()


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

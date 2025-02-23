from PyQt6.QtWidgets import QDialog, QVBoxLayout, QLabel, QPushButton
from PyQt6.QtCore import Qt
from PyQt6.QtGui import QImage, QPixmap
import cv2
import os
# from fpga_accelerated_compressor import fpga_accelerated_compression 


class BlockViewer(QDialog):
    def __init__(self, block, gradient, laplacian, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Block Viewer")
        self.cur_block = block.copy()  # Store a copy of the block

        # Create layout
        layout = QVBoxLayout(self)

        # Create compress button
        self.compress_button = QPushButton("Compress", self)
        self.compress_button.clicked.connect(self.compress)

        # Create and set up image label
        self.image_label = QLabel()
        self.image_label.setMinimumSize(256, 256)

        # Convert OpenCV Mat to QImage
        rgb_block = cv2.cvtColor(block, cv2.COLOR_BGR2RGB)
        height, width, channel = rgb_block.shape
        bytes_per_line = channel * width
        data = bytes(rgb_block.data)
        qimg = QImage(data, width, height, bytes_per_line, QImage.Format.Format_RGB888)

        # Scale up the image for better visibility
        self.image_label.setPixmap(
            QPixmap.fromImage(qimg).scaled(
                256,
                256,
                Qt.AspectRatioMode.KeepAspectRatio,
                Qt.TransformationMode.SmoothTransformation,
            )
        )

        # Create and set up metrics label
        self.metrics_label = QLabel(
            f"Gradient: {gradient:.2f}\nLaplacian: {laplacian:.2f}"
        )
        self.metrics_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

        # Add widgets to layout
        layout.addWidget(self.image_label)
        layout.addWidget(self.metrics_label)
        layout.addWidget(self.compress_button)

    def compress(self):
        # Save current block to temporary file
        os.makedirs("./temp", exist_ok=True)
        cv2.imwrite("./temp/curblock.jpg", self.cur_block)
        fpga_accelerated_compression()

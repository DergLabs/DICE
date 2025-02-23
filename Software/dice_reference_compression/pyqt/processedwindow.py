from PyQt6.QtWidgets import QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QLabel
from PyQt6.QtGui import QPixmap
from PyQt6.QtCore import Qt

class ProcessedWindow(QMainWindow):
    def __init__(self, i1: QPixmap, i2: QPixmap, text: str):
        super().__init__()
        self.setWindowTitle("Image Display")
        self.setGeometry(200, 200, 800, 400)

        # Create a central widget
        central_widget = QWidget(self)
        self.setCentralWidget(central_widget)

        # Main layout for the central widget
        main_layout = QVBoxLayout(central_widget)
        main_layout.setContentsMargins(0, 0, 0, 0)

        # Create labels for images
        self.label1 = QLabel(self)
        self.label1.setMinimumSize(640, 480)
        self.label1.setAlignment(Qt.AlignmentFlag.AlignCenter)
        scaled_pixmap1 = i1.scaled(
            self.label1.size(),
            Qt.AspectRatioMode.KeepAspectRatio,
            Qt.TransformationMode.SmoothTransformation
        )
        self.label1.setPixmap(scaled_pixmap1)

        self.label2 = QLabel(self)
        self.label2.setMinimumSize(640, 480)
        self.label2.setAlignment(Qt.AlignmentFlag.AlignCenter)
        scaled_pixmap2 = i2.scaled(
            self.label2.size(),
            Qt.AspectRatioMode.KeepAspectRatio,
            Qt.TransformationMode.SmoothTransformation
        )
        self.label2.setPixmap(scaled_pixmap2)

        # Create text label
        text_label = QLabel(text)
        text_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

        # Layout for images
        image_layout = QHBoxLayout()
        image_layout.addWidget(self.label1)
        image_layout.addWidget(self.label2)

        # Add image layout and text label to the main layout
        main_layout.addLayout(image_layout)
        main_layout.addWidget(text_label)

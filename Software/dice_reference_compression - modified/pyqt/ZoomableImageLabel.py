# First, let's create a ZoomableImageLabel class that extends QLabel with zooming capabilities
from PyQt6.QtWidgets import QLabel, QSizePolicy
from PyQt6.QtCore import Qt, QPoint
from PyQt6.QtGui import QPixmap, QWheelEvent, QMouseEvent, QPainter, QCursor

class ZoomableImageLabel(QLabel):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.original_pixmap = None
        self.scale_factor = 1.0
        self.min_scale = 0.1
        self.max_scale = 10.0
        self.zoom_step = 0.1
        self.offset = QPoint(0, 0)
        self.last_pan_pos = QPoint(0, 0)
        self.panning = False
        
        # Enable mouse tracking for panning
        self.setMouseTracking(True)
        self.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        self.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
    def set_pixmap(self, pixmap):
        """Set the original pixmap and reset zoom settings"""
        self.original_pixmap = pixmap
        self.scale_factor = 1.0
        self.offset = QPoint(0, 0)
        
        # Adjust initial scale to fit the image in the view
        if pixmap and not pixmap.isNull() and self.width() > 0 and self.height() > 0:
            width_ratio = self.width() / pixmap.width()
            height_ratio = self.height() / pixmap.height()
            fit_scale = min(width_ratio, height_ratio)
            
            # Only scale down, not up
            if fit_scale < 1.0:
                self.scale_factor = max(fit_scale, self.min_scale)
        
        self.update_display()
        
    def update_display(self):
        """Update the displayed pixmap with current zoom and offset"""
        if self.original_pixmap is None or self.original_pixmap.isNull():
            return
            
        # Calculate scaled size
        scaled_width = max(1, int(self.original_pixmap.width() * self.scale_factor))
        scaled_height = max(1, int(self.original_pixmap.height() * self.scale_factor))
        
        # Create scaled pixmap
        scaled_pixmap = self.original_pixmap.scaled(
            scaled_width, 
            scaled_height,
            Qt.AspectRatioMode.KeepAspectRatio,
            Qt.TransformationMode.SmoothTransformation
        )
        
        super().setPixmap(scaled_pixmap)
        self.update()
        
    def wheelEvent(self, event: QWheelEvent):
        """Handle mouse wheel events for zooming"""
        if self.original_pixmap is None:
            return
            
        # Calculate zoom factor based on wheel delta
        delta = event.angleDelta().y()
        zoom_delta = self.zoom_step if delta > 0 else -self.zoom_step
        
        # Get cursor position relative to the widget
        cursor_pos = event.position().toPoint()
        
        # Remember the position on the image where the cursor is
        pos_x = cursor_pos.x() - self.offset.x()
        pos_y = cursor_pos.y() - self.offset.y()
        
        # Calculate relative cursor position (0-1) on the original image
        rel_x = pos_x / (self.original_pixmap.width() * self.scale_factor) if self.original_pixmap.width() * self.scale_factor != 0 else 0.5
        rel_y = pos_y / (self.original_pixmap.height() * self.scale_factor) if self.original_pixmap.height() * self.scale_factor != 0 else 0.5
        
        # Apply zoom
        old_scale = self.scale_factor
        self.scale_factor += zoom_delta
        self.scale_factor = max(self.min_scale, min(self.max_scale, self.scale_factor))
        
        # Adjust offset to keep cursor position on same spot of image - CONVERT TO INT
        self.offset.setX(int(cursor_pos.x() - rel_x * self.original_pixmap.width() * self.scale_factor))
        self.offset.setY(int(cursor_pos.y() - rel_y * self.original_pixmap.height() * self.scale_factor))
        
        self.update_display()
        
    def mousePressEvent(self, event: QMouseEvent):
        """Start panning on middle mouse button press"""
        if event.button() == Qt.MouseButton.MiddleButton:
            self.panning = True
            self.last_pan_pos = event.pos()
            self.setCursor(QCursor(Qt.CursorShape.OpenHandCursor))
        else:
            super().mousePressEvent(event)
            
    def mouseReleaseEvent(self, event: QMouseEvent):
        """Stop panning on middle mouse button release"""
        if event.button() == Qt.MouseButton.MiddleButton:
            self.panning = False
            self.setCursor(QCursor(Qt.CursorShape.ArrowCursor))
        else:
            super().mouseReleaseEvent(event)
            
    def mouseMoveEvent(self, event: QMouseEvent):
        """Pan the image when middle mouse button is held down"""
        if self.panning and self.original_pixmap is not None:
            delta = event.pos() - self.last_pan_pos
            # Create a new QPoint with the updated coordinates
            new_offset = QPoint(self.offset.x() + delta.x(), self.offset.y() + delta.y())
            self.offset = new_offset
            self.last_pan_pos = event.pos()
            self.update()
        else:
            super().mouseMoveEvent(event)
            
    def paintEvent(self, event):
        """Custom paint event to handle panning"""
        if self.original_pixmap is None or self.pixmap() is None:
            super().paintEvent(event)
            return
            
        painter = QPainter(self)
        scaled_pixmap = self.pixmap()
        
        # Calculate centered position
        x = (self.width() - scaled_pixmap.width()) // 2
        y = (self.height() - scaled_pixmap.height()) // 2
        
        # Apply the offset
        x += self.offset.x()
        y += self.offset.y()
        
        # Draw the pixmap at the calculated position
        painter.drawPixmap(x, y, scaled_pixmap)
        
    def reset_zoom(self):
        """Reset zoom to 100% and clear any panning offset"""
        self.scale_factor = 1.0
        self.offset = QPoint(0, 0)
        self.update_display()
        
    def resizeEvent(self, event):
        """Handle resize events to maintain image position"""
        super().resizeEvent(event)
        if self.original_pixmap and not self.original_pixmap.isNull():
            # Re-center the image when resizing
            self.update_display()
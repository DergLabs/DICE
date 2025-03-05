#include "mainwindow.h"
#include "blockviewer.h"
#include <QVBoxLayout>
#include <QWidget>
#include <QEvent>
#include <QResizeEvent>
#include <opencv2/imgproc.hpp>
#include <QScrollBar>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent) {
    setupUI();
    // Create initial blank image
    originalImage = cv::Mat(480, 640, CV_8UC3, cv::Scalar(128, 128, 128));
    processAndDisplayImage();
}

MainWindow::~MainWindow() {}

void MainWindow::setupUI() {
    QWidget *centralWidget = new QWidget(this);
    setCentralWidget(centralWidget);

    QVBoxLayout *layout = new QVBoxLayout(centralWidget);
    layout->setContentsMargins(0, 0, 0, 0);

    // Create scroll area
    scrollArea = new QScrollArea;
    scrollArea->setBackgroundRole(QPalette::Dark);
    scrollArea->setWidgetResizable(true);
    layout->addWidget(scrollArea);

    // Create image label
    imageLabel = new QLabel;
    imageLabel->setMinimumSize(640, 480);
    imageLabel->setAlignment(Qt::AlignCenter);
    scrollArea->setWidget(imageLabel);

    // Create control panel widget for sliders and button
    QWidget *controlPanel = new QWidget;
    QVBoxLayout *controlLayout = new QVBoxLayout(controlPanel);

    // Add labels and sliders for thresholds with horizontal layouts
    QHBoxLayout *gradientLayout = new QHBoxLayout();
    QLabel *gradientLabel = new QLabel("Gradient Threshold:");
    gradientValueLabel = new QLabel();
    gradientThresholdSlider = new QSlider(Qt::Horizontal);
    gradientLayout->addWidget(gradientLabel);
    gradientLayout->addWidget(gradientThresholdSlider);
    gradientLayout->addWidget(gradientValueLabel);
    controlLayout->addLayout(gradientLayout);

    QHBoxLayout *laplacianLayout = new QHBoxLayout();
    QLabel *laplacianLabel = new QLabel("Laplacian Threshold:");
    laplacianValueLabel = new QLabel();
    laplacianThresholdSlider = new QSlider(Qt::Horizontal);
    laplacianLayout->addWidget(laplacianLabel);
    laplacianLayout->addWidget(laplacianThresholdSlider);
    laplacianLayout->addWidget(laplacianValueLabel);
    controlLayout->addLayout(laplacianLayout);

    // Add block count slider
    QHBoxLayout *blockLayout = new QHBoxLayout();
    QLabel *blockLabel = new QLabel("Blocks per side (2^n):");
    blockCountLabel = new QLabel();
    blockCountSlider = new QSlider(Qt::Horizontal);
    blockCountSlider->setMinimum(0); // 2^(0+3) = 8 blocks
    blockCountSlider->setMaximum(4); // 2^(4+3) = 128 blocks
    blockCountSlider->setValue(1);   // 2^(1+3) = 16 blocks (default)
    blockLayout->addWidget(blockLabel);
    blockLayout->addWidget(blockCountSlider);
    blockLayout->addWidget(blockCountLabel);
    controlLayout->addLayout(blockLayout);

    // Create apply button
    QPushButton *applyButton = new QPushButton("Apply Changes");
    controlLayout->addWidget(applyButton);

    // Add control panel to main layout
    layout->addWidget(controlPanel);

    // Connect signals
    connect(gradientThresholdSlider, &QSlider::valueChanged, this,
            &MainWindow::updateVisualization);
    connect(laplacianThresholdSlider, &QSlider::valueChanged, this,
            &MainWindow::updateVisualization);

    // Remove mouse event filters
    // Only keep resize event filter
    imageLabel->installEventFilter(this);

    // Create status bar
    statusBar = new QStatusBar(this);
    setStatusBar(statusBar);

    // Connect signals
    connect(gradientThresholdSlider, &QSlider::valueChanged, this,
            &MainWindow::updateStatusBar);
    connect(laplacianThresholdSlider, &QSlider::valueChanged, this,
            &MainWindow::updateStatusBar);

    // Initialize status bar
    updateStatusBar();

    // Add connection for block count
    connect(blockCountSlider, &QSlider::valueChanged, this,
            &MainWindow::updateBlockCountLabel);
    connect(blockCountSlider, &QSlider::valueChanged, this,
            &MainWindow::processAndDisplayImage);

    // Initialize block count label
    updateBlockCountLabel(blockCountSlider->value());

    // Make the image label accept mouse clicks
    imageLabel->setMouseTracking(true);
    imageLabel->installEventFilter(this);
}

// Add event filter to handle resize events
bool MainWindow::eventFilter(QObject *obj, QEvent *event) {
    if(obj == imageLabel) {
        if(event->type() == QEvent::MouseButtonPress) {
            QMouseEvent *mouseEvent = static_cast<QMouseEvent *>(event);
            if(mouseEvent->button() == Qt::LeftButton) {
                handleMouseClick(mouseEvent);
                return true;
            }
        } else if(event->type() == QEvent::Resize) {
            processAndDisplayImage();
            return true;
        }
    }
    return QMainWindow::eventFilter(obj, event);
}

void MainWindow::analyzeImageBlocks() {
    blockMetrics.clear();

    int blocks = getBlockCount();

    // Calculate block dimensions based on image size
    int blockWidth = originalImage.cols / blocks;
    int blockHeight = originalImage.rows / blocks;

    for(int y = 0; y < blocks; y++) {
        for(int x = 0; x < blocks; x++) {
            // Calculate block region
            int startX = x * blockWidth;
            int startY = y * blockHeight;
            int width =
                (x == blocks - 1) ? originalImage.cols - startX : blockWidth;
            int height =
                (y == blocks - 1) ? originalImage.rows - startY : blockHeight;

            cv::Rect blockRegion(startX, startY, width, height);

            // Extract block
            cv::Mat block = originalImage(blockRegion);

            // Rest of the block analysis remains the same
            std::vector<cv::Mat> channels;
            cv::split(block, channels);

            double gradientSum = 0;
            for(const auto &channel: channels) {
                cv::Mat gradX, gradY;
                cv::Sobel(channel, gradX, CV_64F, 1, 0);
                cv::Sobel(channel, gradY, CV_64F, 0, 1);

                cv::Mat magnitude;
                cv::magnitude(gradX, gradY, magnitude);

                cv::Scalar mean, stddev;
                cv::meanStdDev(magnitude, mean, stddev);
                gradientSum += stddev[0];
            }

            cv::Mat gray;
            cv::cvtColor(block, gray, cv::COLOR_BGR2GRAY);
            cv::Mat laplacian;
            cv::Laplacian(gray, laplacian, CV_64F);
            cv::Scalar mean, stddev;
            cv::meanStdDev(laplacian, mean, stddev);
            double laplacianVar = stddev[0] * stddev[0];

            BlockMetrics metrics;
            metrics.gradientMean = gradientSum / 3.0;
            metrics.laplacianVar = laplacianVar;
            metrics.region = blockRegion;
            blockMetrics.push_back(metrics);
        }
    }
}

void MainWindow::calculateMetricsStats() {
    if(blockMetrics.empty())
        return;

    std::vector<double> gradientValues;
    std::vector<double> laplacianValues;

    metricsStats = MetricsStats(); // Reset stats

    // Collect all values
    for(const auto &metrics: blockMetrics) {
        gradientValues.push_back(metrics.gradientMean);
        laplacianValues.push_back(metrics.laplacianVar);

        // Update min/max
        metricsStats.gradientMin =
            std::min(metricsStats.gradientMin, metrics.gradientMean);
        metricsStats.gradientMax =
            std::max(metricsStats.gradientMax, metrics.gradientMean);
        metricsStats.laplacianMin =
            std::min(metricsStats.laplacianMin, metrics.laplacianVar);
        metricsStats.laplacianMax =
            std::max(metricsStats.laplacianMax, metrics.laplacianVar);
    }

    // Calculate medians
    size_t n = gradientValues.size() / 2;
    std::nth_element(gradientValues.begin(), gradientValues.begin() + n,
                     gradientValues.end());
    std::nth_element(laplacianValues.begin(), laplacianValues.begin() + n,
                     laplacianValues.end());
    metricsStats.gradientMedian = gradientValues[n];
    metricsStats.laplacianMedian = laplacianValues[n];

    // Update sliders and labels
    gradientThresholdSlider->setMinimum(
        static_cast<int>(metricsStats.gradientMin));
    gradientThresholdSlider->setMaximum(
        static_cast<int>(metricsStats.gradientMax));
    gradientThresholdSlider->setValue(
        static_cast<int>(metricsStats.gradientMedian));
    updateGradientLabel(static_cast<int>(metricsStats.gradientMedian));

    laplacianThresholdSlider->setMinimum(
        static_cast<int>(metricsStats.laplacianMin));
    laplacianThresholdSlider->setMaximum(
        static_cast<int>(metricsStats.laplacianMax));
    laplacianThresholdSlider->setValue(
        static_cast<int>(metricsStats.laplacianMedian));
    updateLaplacianLabel(static_cast<int>(metricsStats.laplacianMedian));

    // After setting slider values, update status bar
    updateStatusBar();
}

cv::Mat MainWindow::visualizeBlockMetrics(const cv::Mat &original) {
    cv::Mat visualization = original.clone();

    double gradientThreshold = gradientThresholdSlider->value();
    double laplacianThreshold = laplacianThresholdSlider->value();

    // Process blocks
    for(const auto &metrics: blockMetrics) {
        if(metrics.gradientMean < gradientThreshold ||
           metrics.laplacianVar < laplacianThreshold) {

            // Calculate how much each metric exceeds its threshold as a
            // percentage
            double gradientExcess =
                (metrics.gradientMean - gradientThreshold) / gradientThreshold;
            double laplacianExcess =
                (metrics.laplacianVar - laplacianThreshold) /
                laplacianThreshold;

            // Determine color based on which metric is more influential
            cv::Scalar overlayColor;
            const double THRESHOLD_DIFF =
                0.05; // 5% threshold for considering metrics "equal"

            if(std::abs(gradientExcess - laplacianExcess) < THRESHOLD_DIFF) {
                overlayColor = cv::Scalar(
                    255, 0, 255); // Purple for roughly equal influence
            } else if(gradientExcess > laplacianExcess) {
                overlayColor =
                    cv::Scalar(0, 0, 255); // Red for Laplacian dominance
            } else {
                overlayColor =
                    cv::Scalar(255, 0, 0); // Blue for gradient dominance
            }

            cv::Mat overlay = visualization(metrics.region).clone();
            cv::Mat colorOverlay(overlay.size(), CV_8UC3, overlayColor);
            double alpha = 0.3;
            cv::addWeighted(colorOverlay, alpha, overlay, 1.0 - alpha, 0,
                            overlay);
            overlay.copyTo(visualization(metrics.region));
        }
    }

    // Draw grid lines with black color
    cv::Scalar gridColor(
        0, 0, 0); // Changed from white (255,255,255) to black (0,0,0)
    int thickness = 1;

    int blocks = getBlockCount();

    // Calculate block dimensions
    float blockWidth = visualization.cols / static_cast<float>(blocks);
    float blockHeight = visualization.rows / static_cast<float>(blocks);

    // Draw horizontal lines
    for(int y = 0; y <= blocks; y++) {
        int lineY = static_cast<int>(y * blockHeight);
        if(y == blocks)
            lineY = visualization.rows - 1;
        cv::line(visualization, cv::Point(0, lineY),
                 cv::Point(visualization.cols, lineY), gridColor, thickness);
    }

    // Draw vertical lines
    for(int x = 0; x <= blocks; x++) {
        int lineX = static_cast<int>(x * blockWidth);
        if(x == blocks)
            lineX = visualization.cols - 1;
        cv::line(visualization, cv::Point(lineX, 0),
                 cv::Point(lineX, visualization.rows), gridColor, thickness);
    }

    return visualization;
}

void MainWindow::updateVisualization() {
    if(!blockMetrics.empty()) {
        currentImage = visualizeBlockMetrics(originalImage);

        // Convert to RGB for Qt
        cv::Mat rgbImage;
        cv::cvtColor(currentImage, rgbImage, cv::COLOR_BGR2RGB);
        QImage qimg(rgbImage.data, rgbImage.cols, rgbImage.rows, rgbImage.step,
                    QImage::Format_RGB888);

        // Scale to fit the available space while preserving aspect ratio
        imageLabel->setPixmap(QPixmap::fromImage(qimg).scaled(
            imageLabel->size(), Qt::KeepAspectRatio, Qt::SmoothTransformation));
    }
}

void MainWindow::processAndDisplayImage() {
    analyzeImageBlocks();
    calculateMetricsStats(); // Calculate stats and set up sliders
    updateVisualization();   // Initial visualization
}

void MainWindow::loadImageFromPath(const QString &path) {
    currentImagePath = path; // Store the path
    originalImage = cv::imread(path.toStdString());
    if(originalImage.empty()) {
        originalImage = cv::Mat(480, 640, CV_8UC3, cv::Scalar(128, 128, 128));
    }
    processAndDisplayImage();
}

void MainWindow::reloadImage() {
    if(!currentImagePath.isEmpty()) {
        loadImageFromPath(currentImagePath);
    }
}

void MainWindow::updateGradientLabel(int value) {
    gradientValueLabel->setText(QString::number(value));
}

void MainWindow::updateLaplacianLabel(int value) {
    laplacianValueLabel->setText(QString::number(value));
}

void MainWindow::updateStatusBar() {
    QString status = QString("Blocks: %1x%1 | Gradient Threshold: %2 | "
                             "Laplacian Threshold: %3 | ")
                         .arg(getBlockCount())
                         .arg(gradientThresholdSlider->value())
                         .arg(laplacianThresholdSlider->value());

    status += QString("Colors: Blue = Gradient dominant, Red = Laplacian "
                      "dominant, Purple = Equal influence (±5%)");
    statusBar->showMessage(status);
}

void MainWindow::updateBlockCountLabel(int value) {
    int blocks = 1 << (value + 3); // 2^(value+3)
    blockCountLabel->setText(QString("%1 x %1").arg(blocks));
}

void MainWindow::handleMouseClick(QMouseEvent *event) {
    if(blockMetrics.empty() || currentImage.empty()) {
        qDebug() << "Click ignored - no image or metrics available";
        return;
    }

    // Get the position in the scaled image
    QPixmap pixmap = imageLabel->pixmap(Qt::ReturnByValue);
    if(pixmap.isNull()) {
        qDebug() << "Click ignored - no pixmap available";
        return;
    }

    // Get click position relative to label
    QPoint labelPos = event->pos();
    QSize labelSize = imageLabel->size();
    QSize pixmapSize = pixmap.size();

    qDebug() << "Click detected:";
    qDebug() << "  Raw click position:" << labelPos;
    qDebug() << "  Label size:" << labelSize;
    qDebug() << "  Pixmap size:" << pixmapSize;
    qDebug() << "  Image size:" << currentImage.cols << "x"
             << currentImage.rows;

    // Calculate the actual displayed image rect within the label (accounting
    // for aspect ratio)
    double labelAspect = (double)labelSize.width() / labelSize.height();
    double imageAspect = (double)currentImage.cols / currentImage.rows;

    QRect displayRect;
    if(labelAspect > imageAspect) {
        // Label is wider than image - image is height-constrained
        int displayWidth = (int)(labelSize.height() * imageAspect);
        int xOffset = (labelSize.width() - displayWidth) / 2;
        displayRect = QRect(xOffset, 0, displayWidth, labelSize.height());
    } else {
        // Label is taller than image - image is width-constrained
        int displayHeight = (int)(labelSize.width() / imageAspect);
        int yOffset = (labelSize.height() - displayHeight) / 2;
        displayRect = QRect(0, yOffset, labelSize.width(), displayHeight);
    }

    qDebug() << "  Display rect:" << displayRect;

    // Check if click is within the display rect
    if(!displayRect.contains(labelPos)) {
        qDebug() << "  Click outside image area";
        return;
    }

    // Convert click position to image coordinates
    double scaleX = (double)currentImage.cols / displayRect.width();
    double scaleY = (double)currentImage.rows / displayRect.height();

    int imgX = static_cast<int>((labelPos.x() - displayRect.x()) * scaleX);
    int imgY = static_cast<int>((labelPos.y() - displayRect.y()) * scaleY);

    // Clamp coordinates to image bounds
    imgX = std::clamp(imgX, 0, currentImage.cols - 1);
    imgY = std::clamp(imgY, 0, currentImage.rows - 1);

    qDebug() << "  Image coordinates:" << imgX << "," << imgY;

    // Find which block was clicked
    bool blockFound = false;
    for(const auto &metrics: blockMetrics) {
        if(metrics.region.contains(cv::Point(imgX, imgY))) {
            blockFound = true;
            qDebug() << "  Block found:";
            qDebug() << "    Region:" << metrics.region.x << ","
                     << metrics.region.y << " " << metrics.region.width << "x"
                     << metrics.region.height;
            qDebug() << "    Gradient:" << metrics.gradientMean;
            qDebug() << "    Laplacian:" << metrics.laplacianVar;

            // Extract the block
            cv::Mat block = originalImage(metrics.region).clone();

            // Create and show the block viewer
            BlockViewer *viewer = new BlockViewer(block, metrics.gradientMean,
                                                  metrics.laplacianVar, this);
            viewer->setAttribute(Qt::WA_DeleteOnClose);
            viewer->show();
            break;
        }
    }

    if(!blockFound) {
        qDebug() << "  No block found at this position";
    }
}

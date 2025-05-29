#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSlider>
#include <QPushButton>
#include <QLabel>
#include <opencv2/opencv.hpp>
#include <vector>
#include <QScrollArea>
#include <QWheelEvent>
#include <QScrollBar>
#include <limits>
#include <QStatusBar>

struct BlockMetrics {
    double gradientMean; // Mean of standard deviations of gradients
    double laplacianVar; // Variance of Laplacian
    cv::Rect region;     // Region of the block in the image
};

class MainWindow : public QMainWindow {
    Q_OBJECT

  public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    void loadImageFromPath(const QString &path);

  protected:
    bool eventFilter(QObject *obj, QEvent *event) override;

  private slots:
    void reloadImage();
    void updateGradientLabel(int value);
    void updateLaplacianLabel(int value);
    void handleMouseClick(QMouseEvent *event);

  private:
    void setupUI();
    void processAndDisplayImage();
    void analyzeImageBlocks();
    std::vector<BlockMetrics> calculateBlockMetrics(const cv::Mat &block);
    cv::Mat visualizeBlockMetrics(const cv::Mat &original);

    QLabel *imageLabel;

    cv::Mat originalImage;
    cv::Mat currentImage;
    QString currentImagePath;
    std::vector<BlockMetrics> blockMetrics;
    QScrollArea *scrollArea;

    QSlider *gradientThresholdSlider;
    QSlider *laplacianThresholdSlider;

    struct MetricsStats {
        double gradientMin = std::numeric_limits<double>::max();
        double gradientMax = std::numeric_limits<double>::min();
        double gradientMedian = 0.0;
        double laplacianMin = std::numeric_limits<double>::max();
        double laplacianMax = std::numeric_limits<double>::min();
        double laplacianMedian = 0.0;
    };
    MetricsStats metricsStats;

    void calculateMetricsStats();
    void updateVisualization();

    QLabel *gradientValueLabel;
    QLabel *laplacianValueLabel;
    QStatusBar *statusBar;
    void updateStatusBar();

    QSlider *blockCountSlider;
    QLabel *blockCountLabel;
    int getBlockCount() const {
        return 1 << (blockCountSlider->value() + 3);
    } // 2^(value+3) gives us 8 to 128
    void updateBlockCountLabel(int value);
};

#endif // MAINWINDOW_H

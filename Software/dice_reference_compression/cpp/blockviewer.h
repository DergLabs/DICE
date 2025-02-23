#ifndef BLOCKVIEWER_H
#define BLOCKVIEWER_H

#include <QDialog>
#include <QLabel>
#include <QPushButton>
#include <QProcess>
#include <opencv2/opencv.hpp>

class BlockViewer : public QDialog {
    Q_OBJECT

  public:
    BlockViewer(const cv::Mat &block, double gradient, double laplacian,
                QWidget *parent = nullptr);

  public slots:
    void saveBlock();
    void compress();

  private:
    cv::Mat curBlock;
    QLabel *imageLabel;
    QLabel *metricsLabel;
    QPushButton *saveButton;
    QPushButton *compressButton;
    QProcess *compressProcess;
};

#endif // BLOCKVIEWER_H

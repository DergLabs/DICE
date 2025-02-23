#include "blockviewer.h"
#include <QVBoxLayout>
#include <QFileDialog>
#include <QString>
#include <QDir>
#include <QMessageBox>
#include <QProcess>

BlockViewer::BlockViewer(const cv::Mat &block, double gradient,
                         double laplacian, QWidget *parent)
    : QDialog(parent) {
    setWindowTitle("Block Viewer");

    curBlock = block;
    QVBoxLayout *layout = new QVBoxLayout(this);

    saveButton = new QPushButton("Save Block", this);
    compressButton = new QPushButton("Compress", this);

    connect(saveButton, &QPushButton::clicked, this, &BlockViewer::saveBlock);
    connect(compressButton, &QPushButton::clicked, this,
            &BlockViewer::compress);

    // Create and set up image label
    imageLabel = new QLabel;
    imageLabel->setMinimumSize(256, 256);

    // Convert OpenCV Mat to QImage
    cv::Mat rgbBlock;
    cv::cvtColor(block, rgbBlock, cv::COLOR_BGR2RGB);
    QImage qimg(rgbBlock.data, rgbBlock.cols, rgbBlock.rows, rgbBlock.step,
                QImage::Format_RGB888);

    // Scale up the image for better visibility
    imageLabel->setPixmap(QPixmap::fromImage(qimg).scaled(
        256, 256, Qt::KeepAspectRatio, Qt::SmoothTransformation));

    // Create and set up metrics label
    metricsLabel = new QLabel(QString("Gradient: %1\nLaplacian: %2")
                                  .arg(gradient, 0, 'f', 2)
                                  .arg(laplacian, 0, 'f', 2));
    metricsLabel->setAlignment(Qt::AlignCenter);

    // Add widgets to layout
    layout->addWidget(imageLabel);
    layout->addWidget(metricsLabel);
    layout->addWidget(saveButton);
    layout->addWidget(compressButton);
}

void BlockViewer::saveBlock() {
    // Create file dialog with JPG as default
    QFileDialog dialog(this);
    dialog.setWindowTitle("Save Image");
    dialog.setAcceptMode(QFileDialog::AcceptSave);
    dialog.setDirectory(QDir::homePath());
    dialog.setNameFilter("Images (*.jpg *.jpeg *.png *.bmp *.tiff)");
    dialog.setDefaultSuffix("jpg"); // Forces .jpg if no extension entered

    if(dialog.exec()) {
        QString fileName = dialog.selectedFiles().first();

        if(!curBlock.empty()) {
            bool success = cv::imwrite(fileName.toStdString(), curBlock);
            if(!success) {
                QMessageBox::critical(this, "Save Error",
                                      "Failed to save image file!");
            }
        } else {
            QMessageBox::warning(this, "Empty Image", "No image data to save!");
        }
    }
}

void BlockViewer::compress() {
    // Path to your Python script
    QString scriptPath = "/home/shahriyar/Documents/DICE/Software/"
                         "dice_reference_compression/john-compression.py";
    QString pythonInterpreter = "/home/shahriyar/Documents/DICE/Software/"
                                "dice_reference_compression/.venv/bin/python3";

    // Arguments to pass to the script
    QStringList arguments;
    // arguments << "arg1" << "arg2"; // Add your arguments here
    arguments << scriptPath << "/home/shahriyar/Desktop/img1.jpg";

    // Create a QProcess to execute the script
    QProcess process;
    process.start(pythonInterpreter, arguments);

    // Wait for the process to finish
    if(!process.waitForFinished()) {
        QMessageBox::critical(this, "Error", "Done");
        return;
    }

    // Read the output (optional)
    QString output = process.readAllStandardOutput();
    QString error = process.readAllStandardError();

    // Display output or errors
    if(!output.isEmpty()) {
        qDebug() << "Script Output:" << output;
    }
    if(!error.isEmpty()) {
        QMessageBox::warning(this, "Script Error", error);
    }
}

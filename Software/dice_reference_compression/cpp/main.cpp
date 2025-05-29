#include "mainwindow.h"
#include "config.h"
#include <QApplication>
#include <QCommandLineParser>
#include <QCommandLineOption>

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    QApplication::setApplicationName(PROGRAM_NAME);
    QApplication::setApplicationVersion(PROGRAM_VERSION);

    QCommandLineParser parser;
    parser.setApplicationDescription(PROGRAM_NAME);
    parser.addHelpOption();
    parser.addVersionOption();
    parser.addPositionalArgument("image", "The image file to open.");

    parser.process(app);

    const QStringList args = parser.positionalArguments();

    MainWindow window;
    window.show();

    if(args.isEmpty()) {
        qWarning("No image file specified. Starting with blank image.");
    } else {
        window.loadImageFromPath(args.first());
    }

    return app.exec();
}

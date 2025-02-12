import sys
from PyQt6.QtWidgets import QApplication
from PyQt6.QtCore import QCommandLineParser
from mainwindow import MainWindow  # Assumes you have mainwindow.py

# These would typically come from a config file
PROGRAM_NAME = "Reference Compression"
PROGRAM_VERSION = "0.0.1"


def main():
    app = QApplication(sys.argv)
    app.setApplicationName(PROGRAM_NAME)
    app.setApplicationVersion(PROGRAM_VERSION)

    # Set up command line parser
    parser = QCommandLineParser()
    parser.setApplicationDescription(PROGRAM_NAME)

    # Add default options
    parser.addHelpOption()
    parser.addVersionOption()

    # Add positional argument for image file
    parser.addPositionalArgument("image", "The image file to open.")

    # Process the arguments
    parser.process(app)

    # Get positional arguments
    args = parser.positionalArguments()

    # Create and show main window
    window = MainWindow()
    window.show()

    # Handle image loading
    if not args:
        print(
            "Warning: No image file specified. Starting with blank image.",
            file=sys.stderr,
        )
    else:
        window.load_image_from_path(args[0])

    return app.exec()


if __name__ == "__main__":
    sys.exit(main())

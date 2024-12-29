#include <iomanip>
#include <ios>
#include <iterator>
#include <opencv2/core.hpp>
#include <opencv2/core/hal/interface.h>
#include <opencv2/core/mat.hpp>
#include <opencv2/core/types.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>
#include <ostream>
#include <sstream>
#include <string>
#include <vector>

// void makeEven(cv::Mat im) {
// 	int newWidth, newHeight;
// 	newWidth = im.cols + (im.cols%2);
// 	newHeight = im.rows + (im.rows%2);
//
// }
//

std::vector<cv::Mat> splitImage(cv::Mat &im, int nXTiles, int nYTiles) {
    std::vector<cv::Mat> tiles;

    int tileWidth = im.cols / nXTiles;
    int tileHeight = im.rows / nYTiles;

    // std::cout << "Image Width: " << im.rows << "\n"
    //           << "Image Height: " << im.cols << "\n"
    //           << "Tile Width: " << tileWidth << "\n"
    //           << "Tile Height: " << tileHeight << "\n";

    for(int y = 0; y < nYTiles; y++) {
        for(int x = 0; x < nXTiles; x++) {
            // std::cout << "Region of interest (" << x * tileWidth << ", "
            //           << y * tileHeight << ")"<<std::endl;
            cv::Rect roi{x * tileWidth, y * tileHeight, tileWidth, tileHeight};
            cv::Mat tile = im(roi).clone();
            tiles.push_back(tile);
        }
    }

    return tiles;
}

double calcMeanStdDevGradient(const cv::Mat &tile) {
    cv::Mat out;
    cv::Sobel(tile, out, -1, 1, 0, 5);
    cv::Sobel(tile, out, -1, 0, 1, 5);

    cv::Scalar rgbMean, rgbStdDev;
    cv::meanStdDev(out, rgbMean, rgbStdDev);
    // std::cout << "Mean " << rgbMean << " σ " << rgbStdDev << "\n";
    // cv::imshow("", out);
    // cv::waitKey(0);

    auto mean = (rgbStdDev[0] + rgbStdDev[1] + rgbStdDev[2]) / 3.0;
    return mean;
}

auto calcMeanStdDevLaplacian(const cv::Mat tile) {
    cv::Mat laplacianTile;
    cv::Scalar rgbMean, rgbStdDev;

    cv::Laplacian(tile, laplacianTile, -1);
    cv::meanStdDev(tile, rgbMean, rgbStdDev);
    // std::cout << "Laplacian: Mean " << rgbMean << " σ " << rgbStdDev << "\n";
    // return std::max({rgbStdDev[0], rgbStdDev[1], rgbStdDev[2]});
    auto mean = (rgbStdDev[0] + rgbStdDev[1] + rgbStdDev[2]) / 3.0;
    return mean;
    // cv::imshow("", laplacianTile);
    // cv::waitKey(0);
}

bool decisionLogic(cv::Mat &tile, double gradient, double laplacian) {
    return gradient > 60.0 && laplacian > 39.0;
}

void drawLine(cv::Mat im, int sx, int sy, int ex, int ey) {
    cv::Point sp{sx, sy};
    cv::Point ep{ex, ey};
    cv::Scalar lineColor{0, 0, 0};
    int thickness{10};
    cv::line(im, sp, ep, lineColor, thickness, cv::LINE_AA);
}

void drawGrid(cv::Mat im, int nXTiles, int nYTiles) {
    int tileWidth = im.cols / nXTiles;
    int tileHeight = im.rows / nYTiles;

    for(int i = 0; i < nXTiles; i++) {
        drawLine(im, i * tileWidth, 0, i * tileWidth, im.rows);
    }

    for(int i = 0; i < nYTiles; i++) {
        drawLine(im, 0, i * tileHeight, im.cols, i * tileHeight);
    }
}

cv::Mat recombineTiles(const std::vector<cv::Mat> tiles, int rows, int cols) {
    // Get tile dimensions (assuming all tiles are the same size)
    int tileHeight = tiles[0].rows;
    int tileWidth = tiles[0].cols;

    int tileType = tiles[0].type();

    // Create output image
    cv::Mat result(tileHeight * rows, tileWidth * cols, tileType);

    // Copy each tile into the correct position
    for(int i = 0; i < rows; i++) {
        for(int j = 0; j < cols; j++) {
            cv::Mat tile = tiles[i * cols + j];

            // Check if tile has correct dimensions and type
            if(tile.rows != tileHeight || tile.cols != tileWidth ||
               tile.type() != tileType) {
                throw std::runtime_error("Tile dimensions or type mismatch");
            }

            // Calculate ROI (Region of Interest) for this tile
            cv::Rect roi(j * tileWidth,  // x position
                         i * tileHeight, // y position
                         tileWidth,      // width
                         tileHeight);    // height

            // Copy tile into result
            tile.copyTo(result(roi));
        }
    }

    return result;
}

cv::Mat addRedHue(const cv::Mat &im) {
    std::vector<cv::Mat> channels;
    cv::Mat result;

    cv::split(im, channels);

    channels[2] = channels[2] * 3;

    cv::threshold(channels[2], channels[2], 255, 255, cv::THRESH_TRUNC);

    cv::merge(channels, result);
    return result;
}

void lossless(cv::Mat &tile) {}
void lossy(cv::Mat &tile) {}

int main(int argc, char *argv[]) {

    cv::Mat image = cv::imread(argv[1]); // Load an image
    if(image.empty()) {
        std::cerr << "Could not open or find the image!" << std::endl;
        return -1;
    }

    // Make Even
    int imWidth = image.cols;
    int imHeight = image.rows;

    // Split Image
    std::vector<cv::Mat> tiles = splitImage(image, 16, 16);
    std::vector<cv::Mat> resultTiles;
    // std::cout << "Tile\tMeanGrad\tMeanLaplace\n";
    for(int i = 0; i < tiles.size(); i++) {
        double avgStdDevGradient = calcMeanStdDevGradient(tiles[i]);
        double avgStdDevLaplacian = calcMeanStdDevLaplacian(tiles[i]);

        std::stringstream precision;

        precision << std::fixed << std::setprecision(2) << avgStdDevGradient;
        std::string gradStr = precision.str();

        precision.str("");
        precision.clear();
        precision << std::fixed << std::setprecision(2) << avgStdDevLaplacian;

        std::string laplaceStr = precision.str();

        bool lossy =
            decisionLogic(tiles[i], avgStdDevGradient, avgStdDevLaplacian);
		if(lossy) {
			tiles[i] = addRedHue(tiles[i]);
		}

        // cv::putText(tiles[i], "spaghetti", cv::Point(8, 32),
        //             cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 0, 0), 4,
        //             cv::LINE_AA);
        cv::putText(tiles[i], "Grad: " + gradStr, cv::Point(8, 32),
                    cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 0, 0), 2,
                    cv::LINE_AA);
        cv::putText(tiles[i], "Lapl: " + laplaceStr, cv::Point(8, 64),
                    cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 0, 0), 2,
                    cv::LINE_AA);
        // std::cout << i << "\t" << avgStdDevGradient << "\t"
        //           << avgStdDevLaplacian << "\n";
    }
    std::cout << "Time to recombine" << std::endl;
    cv::Mat recombined = recombineTiles(tiles, 16, 16);
    // std::cout << "Image depth " << image.depth() << "\n";
    // std::cout << "Tile depth " << tiles.at(52).depth() << "\n";
    cv::namedWindow("X", cv::WINDOW_NORMAL);
    cv::resizeWindow("X", 800, 600);

    drawGrid(recombined, 16, 16);

    cv::imshow("X", recombined);
    cv::waitKey(0);
    image.deallocate();

    // const cv::Mat &tile = tiles.at(52);
    // cv::Scalar avgStdDevGradient = calcStdDevGradient(tile);
    // cv::Scalar avgStdDevLaplacian = calcMeanStdDevLaplacian(tile);
    //
    // if(decisionLogic(tiles.at(52), avgStdDevGradient, avgStdDevLaplacian)) {
    //     lossless(tiles.at(52));
    // } else {
    //     lossy(tiles.at(52));
    // }
    // cv::imshow("Wtahever", tiles.at(52));
    // cv::waitKey();
    //    cv::imshow("Whatever", out);
    //    cv::waitKey(0);
    // cv::imshow("Display Window", image); // Show the image in a window
    // cv::waitKey(0); // Wait for a key press

    return 0;
}

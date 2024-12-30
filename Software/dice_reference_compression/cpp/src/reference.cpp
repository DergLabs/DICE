#include <iomanip>
#include <ios>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
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

struct Context {
    cv::Mat img;
    int width;
    int height;
    int xTiles;
    int yTiles;
    int gradThreshold;
    int laplacianThreshold;
};

struct Context *ctx = new struct Context;

std::vector<cv::Mat> splitImage(cv::Mat &im, int nXTiles, int nYTiles) {
    std::vector<cv::Mat> tiles;

    int tileWidth = im.cols / nXTiles;
    int tileHeight = im.rows / nYTiles;

    for(int y = 0; y < nYTiles; y++) {
        for(int x = 0; x < nXTiles; x++) {
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

    auto mean = (rgbStdDev[0] + rgbStdDev[1] + rgbStdDev[2]) / 3.0;
    return mean;
}

auto calcMeanStdDevLaplacian(const cv::Mat tile) {
    cv::Mat laplacianTile;
    cv::Scalar rgbMean, rgbStdDev;

    cv::Laplacian(tile, laplacianTile, -1);
    cv::meanStdDev(tile, rgbMean, rgbStdDev);
    auto mean = (rgbStdDev[0] + rgbStdDev[1] + rgbStdDev[2]) / 3.0;
    return mean;
}

bool shouldCompress(cv::Mat &tile, double gradient, double laplacian) {
    return gradient < ctx->gradThreshold && laplacian < ctx->laplacianThreshold;
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

    channels[0] = channels[0] * 0.5;
    channels[1] = channels[1] * 0.5;
    channels[2] = channels[2] * 3;

    cv::threshold(channels[2], channels[2], 255, 255, cv::THRESH_TRUNC);

    cv::merge(channels, result);
    return result;
}

void lossless(cv::Mat &tile) {}
void lossy(cv::Mat &tile) {}

cv::Mat viewTileCategory(cv::Mat &im, int xTiles, int yTiles) {
    // Split Image
    std::vector<cv::Mat> tiles = splitImage(im, xTiles, yTiles);
    std::vector<cv::Mat> resultTiles;
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
            shouldCompress(tiles[i], avgStdDevGradient, avgStdDevLaplacian);
        if(lossy) {
            tiles[i] = addRedHue(tiles[i]);
        }

        cv::putText(tiles[i], "Grad: " + gradStr, cv::Point(8, 32),
                    cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 0, 0), 2,
                    cv::LINE_AA);
        cv::putText(tiles[i], "Lapl: " + laplaceStr, cv::Point(8, 64),
                    cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 0, 0), 2,
                    cv::LINE_AA);
    }

    cv::Mat recombined = recombineTiles(tiles, xTiles, yTiles);
    return recombined;
}

void recalcButtonCB() {
    auto res = viewTileCategory(ctx->img, ctx->xTiles, ctx->yTiles);
    drawGrid(res, ctx->xTiles, ctx->yTiles);
    cv::imshow("X", res);
}

void gThresh(int v, void *userData) {
    ctx->gradThreshold = v;
    recalcButtonCB();
}

void lThresh(int v, void *userData) {
    ctx->laplacianThreshold = v;
    recalcButtonCB();
}

int main(int argc, char *argv[]) {
    cv::Mat image = cv::imread(argv[1]); // Load an image
    if(image.empty()) {
        std::cerr << "Could not open or find the image!" << std::endl;
        return -1;
    }

    ctx->img = image;
    ctx->width = image.cols;
    ctx->height = image.rows;
    ctx->xTiles = 16;
    ctx->yTiles = 16;
    ctx->gradThreshold = 60;
    ctx->laplacianThreshold = 39;

    cv::namedWindow("X", cv::WINDOW_NORMAL | cv::WINDOW_GUI_EXPANDED);
    cv::resizeWindow("X", 800, 600);

    cv::createTrackbar("Gradient Threshold", "X", nullptr, 100, gThresh);
    cv::createTrackbar("Laplacian Threshold", "X", nullptr, 100, lThresh);

    cv::setTrackbarPos("Gradient Threshold", "X", ctx->gradThreshold);
    cv::setTrackbarPos("Laplacian Threshold", "X", ctx->laplacianThreshold);

    auto res = viewTileCategory(image, ctx->xTiles, ctx->yTiles);
    drawGrid(res, ctx->xTiles, ctx->yTiles);

    cv::imshow("X", res);
    cv::waitKey(0);
    image.deallocate();
	delete ctx;

    return 0;
}

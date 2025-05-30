#include <opencv2/opencv.hpp>
#include <iostream>
#include <string>
#include "image_handler.h"

int main() {
    // Path to the image
    std::string imagePath = "/Users/john/Desktop/Projects/DICE/Software/C_software_test/test_images/flowers1.png";
    printf("Image Path: %s\n", imagePath.c_str());

    // Initialize the image and channels
    cv::Mat image;  // Changed from pointer to object
    std::vector<cv::Mat> channels;  // Changed from pointer to object

    // Get the image and its channels
    int result = get_image(imagePath, &channels, &image);  // Pass addresses

    if (result != 0) {
        std::cout << "Failed to get image" << std::endl;
        return -1;
    }

    // Display images
    display_image(image, "Original Image");
    display_channel(channels[0], "Blue Channel");
    display_channel(channels[1], "Green Channel");
    display_channel(channels[2], "Red Channel");

    // Get dimensions
    int rows = image.rows;  // Use dot operator, not arrow
    int cols = image.cols;

    // Create 2D arrays for each channel
    unsigned char** blueChannel = new unsigned char*[rows];
    unsigned char** greenChannel = new unsigned char*[rows];
    unsigned char** redChannel = new unsigned char*[rows];

    for (int i = 0; i < rows; i++) {
        blueChannel[i] = new unsigned char[cols];
        greenChannel[i] = new unsigned char[cols];
        redChannel[i] = new unsigned char[cols];
    }

    // Copy data from OpenCV Mat to our 2D arrays
    for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
            // OpenCV uses BGR order
            blueChannel[r][c] = channels[0].at<uchar>(r, c);
            greenChannel[r][c] = channels[1].at<uchar>(r, c);
            redChannel[r][c] = channels[2].at<uchar>(r, c);
        }
    }

    // Rest of the code remains the same
    std::cout << "Image dimensions: " << rows << "x" << cols << std::endl;
    std::cout << "Created 3 separate 2D arrays of 8-bit unsigned integers:" << std::endl;
    std::cout << "- Blue channel: " << rows << "x" << cols << std::endl;
    std::cout << "- Green channel: " << rows << "x" << cols << std::endl;
    std::cout << "- Red channel: " << rows << "x" << cols << std::endl;

    cv::waitKey(0);

    // Memory cleanup
    for (int i = 0; i < rows; i++) {
        delete[] blueChannel[i];
        delete[] greenChannel[i];
        delete[] redChannel[i];
    }
    delete[] blueChannel;
    delete[] greenChannel;
    delete[] redChannel;

    return 0;
}



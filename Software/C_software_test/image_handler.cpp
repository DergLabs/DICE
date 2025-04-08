//
// Created by John Hofmeyr on 3/11/25.
//

#include "image_handler.h"

// Returns 0 when successful, -1 when failed
int get_image(std::string filename, std::vector<cv::Mat>* channels, cv::Mat* image) {
    // Load an image from file
    printf("Image Path: %s\n", filename.c_str());

    // Read the image
    cv::Mat input_image = cv::imread(filename, cv::IMREAD_COLOR); // Fixed flag

    // Check if image was successfully loaded
    if (input_image.empty()) {
        std::cout << "Error: Could not read image" << std::endl;
        return -1;
    }

    // Split the image into its three channels (BGR)
    std::vector<cv::Mat> color_channels;
    cv::split(input_image, color_channels);

    // Set output image and channels
    *image = input_image;
    *channels = color_channels;

    return 0;
}

void display_image(cv::Mat image, std::string image_name) {
    // Display the image
    cv::namedWindow(image_name, cv::WINDOW_AUTOSIZE);
    cv::imshow(image_name, image);
}

void display_channel(cv::Mat channel, std::string channel_name) {
    // Display the channel
    cv::namedWindow(channel_name, cv::WINDOW_AUTOSIZE);
    cv::imshow(channel_name, channel);
}
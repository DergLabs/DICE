#ifndef IMAGE_HANDLER_H
#define IMAGE_HANDLER_H

#include <opencv2/opencv.hpp>
#include <iostream>
#include <string>

int get_image(std::string filename, std::vector<cv::Mat>* channels, cv::Mat* image);
void display_image(cv::Mat image, std::string image_name);
void display_channel(cv::Mat channel, std::string channel_name);

#endif // IMAGE_HANDLER_H
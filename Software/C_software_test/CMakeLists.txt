cmake_minimum_required(VERSION 3.23)
set(CMAKE_OSX_ARCHITECTURES x86_64) # Force x86_64 arch for arm Mac's

project(C_software_test)
set(CMAKE_CXX_STANDARD 23)

find_package(OpenCV)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(C_software_test main.cpp image_handler.cpp image_handler.h image_codec.cpp image_codec.h)

target_link_libraries(C_software_test ${OpenCV_LIBS})

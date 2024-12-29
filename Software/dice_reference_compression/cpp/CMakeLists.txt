cmake_minimum_required(VERSION 3.2)
project(dice_reference_compression CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQURED on)

# Find OpenCV
find_package(OpenCV REQUIRED)

add_executable(rc src/reference.cpp)

# Include Directories
target_include_directories(rc PRIVATE ${OpenCV_INCLUDE_DIRS})

target_link_libraries(rc ${OpenCV_LIBS})




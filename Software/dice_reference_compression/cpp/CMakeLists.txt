cmake_minimum_required(VERSION 3.16)
project(image_adjuster)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Widgets)
find_package(OpenCV REQUIRED)

# Add version info and description
configure_file(
    "${PROJECT_SOURCE_DIR}/config.h.in"
    "${PROJECT_BINARY_DIR}/config.h"
)

add_executable(image_adjuster
    main.cpp
    mainwindow.cpp
    mainwindow.h
    blockviewer.cpp
    blockviewer.h
)

target_link_libraries(image_adjuster PRIVATE
    Qt6::Widgets
    ${OpenCV_LIBS}
)

target_include_directories(image_adjuster PRIVATE
    ${PROJECT_BINARY_DIR}
) 
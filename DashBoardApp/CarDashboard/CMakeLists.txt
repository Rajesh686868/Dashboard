cmake_minimum_required(VERSION 3.14)

project(CarDashboard)

add_library(CarDashboard STATIC  cardashboard.cpp cardashboard.h)

find_package(Qt5 5.2 COMPONENTS Quick Gui REQUIRED)
find_package(Qt5 COMPONENTS Core REQUIRED)
include_directories(${Qt5Core_INCLUDE_DIRS})
target_link_libraries(CarDashboard PUBLIC Qt5::Core)
target_link_libraries(CarDashboard PRIVATE Qt5::Gui Qt5::Quick Qt5::Core)

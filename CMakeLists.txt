cmake_minimum_required(VERSION 3.16.3)
project(place_recognition) 
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

#
find_package(OpenCV 4.6 REQUIRED)
if(OpenCV_FOUND)
  message(STATUS "Found OpenCV version ${OpenCV_VERSION}")
  include_directories(${OpenCV_INCLUDE_DIRS})
else()
  message(FATAL_ERROR "OpenCV not found, please read the README.md")
endif(OpenCV_FOUND)
#

include_directories(include)
add_library(image_browser src/html_writer.cpp src/image_browser.cpp)
add_library(serialization src/serialize.cpp)
target_link_libraries(serialization ${OpenCV_LIBS})
target_include_directories(serialization INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

add_library(convert_dataset src/convert_dataset.cpp)
target_link_libraries(convert_dataset ${OpenCV_LIBS})
target_include_directories(convert_dataset INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

add_library(kmeans src/kmeans.cpp)
target_link_libraries(kmeans ${OpenCV_LIBS})
target_include_directories(kmeans INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

add_library(bow_dictionary src/bow_dictionary.cpp)
target_link_libraries(bow_dictionary ${OpenCV_LIBS} serialization kmeans)
target_include_directories(bow_dictionary INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

add_library(histogram src/histogram.cpp)
target_link_libraries(histogram ${OpenCV_LIBS})
target_include_directories(histogram INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

add_library(recognition src/recognition.cpp)
target_link_libraries(recognition ${OpenCV_LIBS} bow_dictionary kmeans histogram convert_dataset image_browser)
target_include_directories(recognition INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

add_library(place_recognition INTERFACE)
target_link_libraries(place_recognition INTERFACE serialization convert_dataset kmeans bow_dictionary ${OpenCV_LIBS} histogram image_browser recognition)
target_include_directories(place_recognition INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)
target_compile_features(place_recognition INTERFACE cxx_std_20)
target_compile_options(place_recognition INTERFACE -Wall -Werror)

add_executable(main src/main.cpp)
target_link_libraries(main ${OpenCV_LIBS} recognition)

#enable_testing()
#add_subdirectory(tests)
cmake_minimum_required(VERSION 3.10)

project(GameEngine CXX)

add_executable(enginetest src/main.cpp)

target_compile_options(enginetest PRIVATE -Werror -Wall -Wpedantic -O0 -g)

target_include_directories(enginetest PRIVATE includes)
cmake_minimum_required(VERSION 3.12)

include(external/pico_sdk_import.cmake)

project(retro-pico-switch C CXX ASM)

pico_sdk_init()

add_subdirectory(tools)
add_subdirectory(src)

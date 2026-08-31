
cmake_minimum_required(VERSION 3.12)

set(PICO_FLASH_SIZE_BYTES 16777216 CACHE STRING "" FORCE)

include(external/pico_sdk_import.cmake)

project(retro-pico-switch C CXX ASM)

pico_sdk_init()

add_subdirectory(tools)
add_subdirectory(src)

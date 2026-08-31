cmake_minimum_required(VERSION 3.12)

set(PICO_FLASH_SIZE_BYTES 16777216 CACHE STRING "" FORCE)

if(EXISTS "$ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake")
    include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
elseif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/external/pico_sdk_import.cmake")
    include(${CMAKE_CURRENT_SOURCE_DIR}/external/pico_sdk_import.cmake)
endif()

project(retro-pico-switch C CXX ASM)

pico_sdk_init()

add_subdirectory(src)

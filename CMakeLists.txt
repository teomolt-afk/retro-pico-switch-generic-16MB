cmake_minimum_required(VERSION 3.12)

# Set 16MB flash size explicitly
set(PICO_FLASH_SIZE_BYTES 16777216 CACHE STRING "" FORCE)

# Include Pico SDK import script directly from PICO_SDK_PATH or external folder
if(EXISTS "$ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake")
    include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
elseif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/external/pico_sdk_import.cmake")
    include(${CMAKE_CURRENT_SOURCE_DIR}/external/pico_sdk_import.cmake)
endif()

project(retro-pico-switch C CXX ASM)

# Initialize SDK functions
pico_sdk_init()

add_subdirectory(tools)
add_subdirectory(src)

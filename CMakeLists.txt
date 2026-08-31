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

# Conditionally add subdirectories only if they actually exist
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/tools/CMakeLists.txt")
    add_subdirectory(tools)
endif()

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/src/CMakeLists.txt")
    add_subdirectory(src)
endif()

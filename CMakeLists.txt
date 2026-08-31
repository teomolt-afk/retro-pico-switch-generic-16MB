cmake_minimum_required(VERSION 3.13)

# Force 16MB Flash Target for RP2040 DollaTek / Clone boards
set(PICO_FLASH_SIZE_BYTES 16777216 CACHE STRING "" FORCE)

# Set Pico SDK path to internal submodule or fallback
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/external/pico_sdk_import.cmake")
    include(external/pico_sdk_import.cmake)
elseif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/pico-sdk/external/pico_sdk_import.cmake")
    include(pico-sdk/external/pico_sdk_import.cmake)
else()
    include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
endif()

project(retro-pico-switch C CXX ASM)

pico_sdk_init()

# Include project subdirectories
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/tools/CMakeLists.txt")
    add_subdirectory(tools)
endif()

add_subdirectory(src)

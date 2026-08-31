cmake_minimum_required(VERSION 3.12)

# Pull in SDK (search PICO_SDK_PATH first)
if(DEFINED ENV{PICO_SDK_PATH} AND NOT DEFINED PICO_SDK_PATH)
    set(PICO_SDK_PATH $ENV{PICO_SDK_PATH})
endif()

if(PICO_SDK_PATH)
    include(${PICO_SDK_PATH}/external/pico_sdk_import.cmake)
else()
    include(external/pico_sdk_import.cmake)
endif()

project(retro-pico-switch C CXX ASM)

# Initialize the SDK
pico_sdk_init()

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
include($ENV{PICO_SDK_PATH}/tools/CMakeLists.txt)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PICO_CXX_ENABLE_EXCEPTIONS 1)
set(PICO_BOARD pico_w)
set(PICO_FLASH_SIZE_BYTES 16777216)


project(retro_pico_switch C CXX ASM)

pico_sdk_init()
add_subdirectory(src)

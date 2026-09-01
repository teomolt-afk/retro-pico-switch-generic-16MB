cmake_minimum_required(VERSION 3.12)

# Set 16MB flash size explicitly
set(PICO_FLASH_SIZE_BYTES 16777216 CACHE STRING "" FORCE)

# Force standard Pico board layout
set(PICO_BOARD pico CACHE STRING "" FORCE)

# Locate Pico SDK import script
if(EXISTS "$ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake")
    include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
elseif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/external/pico_sdk_import.cmake")
    include(${CMAKE_CURRENT_SOURCE_DIR}/external/pico_sdk_import.cmake)
endif()

project(retro-pico-switch C CXX ASM)

pico_sdk_init()

# Enable C++ Exceptions globally across GCC to fix 'try/catch' in SwitchUsb.cpp
add_compile_options(-fexceptions)

# Include hardware and SDK paths
include_directories(
    ${PICO_SDK_PATH}/src/common/pico_base/include
    ${PICO_SDK_PATH}/src/rp2040/hardware_structs/include
    ${PICO_SDK_PATH}/src/rp2_common/hardware_pio/include
    ${PICO_SDK_PATH}/src/rp2_common/hardware_base/include
    ${PICO_SDK_PATH}/src/rp2_common/pico_platform/include
    ${PICO_SDK_PATH}/src/rp2_common/hardware_gpio/include
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_subdirectory(src)

# Enable C++ exception handling for try/catch blocks in SwitchUsb.cpp
add_compile_options(-fexceptions)

# Include header paths needed for USB controller compilation
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/../../include
    ${PICO_SDK_PATH}/src/common/pico_base/include
    ${PICO_SDK_PATH}/src/rp2040/hardware_structs/include
    ${PICO_SDK_PATH}/src/rp2_common/hardware_pio/include
    ${PICO_SDK_PATH}/src/rp2_common/hardware_base/include
    ${PICO_SDK_PATH}/src/rp2_common/pico_platform/include
    ${PICO_SDK_PATH}/src/rp2_common/hardware_gpio/include
)

# Build ONLY the USB wired controller binary
add_executable(switchUsb
    SwitchUsb.cpp
    SwitchCommon.cpp
)

# Link standard Pico SDK hardware libraries to the USB executable
target_link_libraries(switchUsb 
    pico_stdlib 
    hardware_pio 
    hardware_gpio 
    hardware_dma
)

pico_add_extra_outputs(switchUsb)

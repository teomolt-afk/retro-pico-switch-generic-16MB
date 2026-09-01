# Enable C++ exceptions globally for try/catch in SwitchUsb.cpp
add_compile_options(-fexceptions)

# Collect all C/C++ source files in src and subdirectories
file(GLOB_RECURSE SOURCES 
    "*.cpp" 
    "*.c"
)

# Exclude Bluetooth source files so it builds purely for wired RP2040
list(FILTER SOURCES EXCLUDE REGEX ".*SwitchBluetooth.*")

# Create the main executable target
add_executable(retro_pico_switch ${SOURCES})

# Include project headers and SDK headers
target_include_directories(retro_pico_switch PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../include
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# Link SDK libraries directly to the executable target
target_link_libraries(retro_pico_switch 
    pico_stdlib 
    hardware_pio 
    hardware_gpio 
    hardware_dma
)

# Generate the final .uf2 binary file
pico_add_extra_outputs(retro_pico_switch)

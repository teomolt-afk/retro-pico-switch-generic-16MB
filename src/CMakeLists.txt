# Enable C++ exceptions for try/catch blocks
add_compile_options(-fexceptions)

# Find all C and C++ source files in src/
file(GLOB_RECURSE SOURCES 
    "*.cpp" 
    "*.c"
)

# Exclude Bluetooth code to stick strictly to wired USB
list(FILTER SOURCES EXCLUDE REGEX ".*SwitchBluetooth.*")

# Create the executable binary
add_executable(retro_pico_switch ${SOURCES})

# Add include paths for headers
target_include_directories(retro_pico_switch PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../include
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# Link SDK libraries and TinyUSB directly to our executable target
target_link_libraries(retro_pico_switch 
    pico_stdlib 
    tinyusb_device
    tinyusb_board
    hardware_pio 
    hardware_gpio 
    hardware_dma
)

# Generate the .uf2 file
pico_add_extra_outputs(retro_pico_switch)

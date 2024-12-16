# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Initialise pico_sdk from installed location
# (note this can come from environment, CMake cache etc)

# == DO NEVER EDIT THE NEXT LINES for Raspberry Pi Pico VS Code Extension to work ==
if(WIN32)
    set(USERHOME $ENV{USERPROFILE})
else()
    set(USERHOME $ENV{HOME})
endif()
set(sdkVersion 2.0.0)
set(toolchainVersion 13_2_Rel1)
set(picotoolVersion 2.0.0)
set(picoVscode ${USERHOME}/.pico-sdk/cmake/pico-vscode.cmake)
if (EXISTS ${picoVscode})
    include(${picoVscode})
endif()
# ====================================================================================
set(PICO_BOARD pico CACHE STRING "Board type")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(dice_io_module_firmware C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

# Option to build with IMX477 or IMX219 with defualt to IMX219
option(CAM_TARGET "Choose Camera Module to target: 477 or 219" "219")
# Conditional logic to build the correct binary
if (CAM_TARGET STREQUAL "219")
	message(STATUS "Building firmware targetting IMX219 Module")
    add_executable(
		dice_io_module_firmware
		dice_io_module_firmware.c
		functions.c
		dice_imx219.c
	)
elseif (CAM_TARGET STREQUAL "binary2")
	message(STATUS "Building firmware targetting IMX477 Module")
    add_executable(
		dice_io_module_firmware
		dice_io_module_firmware.c
		functions.c
		dice_imx477.c
	)
else()
    message(FATAL_ERROR "Invalid option for CAM_TARGET. Use '477' or '219'.")
endif()
target_compile_definitions(dice_io_module_firmware PRIVATE CAM_TARGET=${CAM_TARGET})

# Add executable. Default name is the project name, version 0.1

# add_executable(
# 	dice_io_module_firmware
# 	dice_io_module_firmware.c
# 	functions.c
# 	dice_imx477.c
# )


pico_set_program_name(dice_io_module_firmware "dice_io_module_firmware")
pico_set_program_version(dice_io_module_firmware "0.1")

# Modify the below lines to enable/disable output over UART/USB
pico_enable_stdio_usb(dice_io_module_firmware 1)
pico_enable_stdio_uart(dice_io_module_firmware 0)

# Add the standard library to the build
target_link_libraries(dice_io_module_firmware
        pico_stdlib)

# set SPI clock slower than CPU clock so that it works
pico_define_boot_stage2(slower_boot2 ${PICO_DEFAULT_BOOT_STAGE2_FILE})
target_compile_definitions(slower_boot2 PRIVATE PICO_FLASH_SPI_CLKDIV=4)
pico_set_boot_stage2(${PROJECT_NAME} slower_boot2)

# Add the standard include files to the build
target_include_directories(dice_io_module_firmware PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}
  ${CMAKE_CURRENT_LIST_DIR}/.. # for our common lwipopts or any other standard includes, if required
)

# Add any user requested libraries
target_link_libraries(dice_io_module_firmware 
	hardware_i2c
	hardware_timer
	hardware_clocks
)

pico_add_extra_outputs(dice_io_module_firmware)


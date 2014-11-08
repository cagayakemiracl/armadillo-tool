cmake_minimum_required(VERSION 2.6)

add_definitions("-Wall -W -O3 -Wextra")
set(CMAKE_C_FLAGS_DEBUG "-g")
#set(CMAKE_EXE_LINKER_FLAGS -lm)
set(TARGET_LINK_LIBRARIES m)

set(CMAKE_C_COMPILER arm-linux-gnueabi-gcc)

set(ORIG_SOURCES
  open_file.c
  write_file.c
  control_led.c
  turn_on_led.c
  turn_off_led.c
  str2int.c
)
#add_library(orig SHARED ${ORIG_SOURCES})
add_library(orig-static STATIC ${ORIG_SOURCES})

SET_TARGET_PROPERTIES(orig-static PROPERTIES OUTPUT_NAME "orig")

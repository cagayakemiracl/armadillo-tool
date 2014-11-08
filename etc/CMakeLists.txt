cmake_minimum_required(VERSION 2.6)

set(TARGET %s)

add_definitions("-Wall -W -O3 -Wextra")

set(CMAKE_C_COMPILER arm-linux-gnueabi-gcc)

INCLUDE_DIRECTORIES("${PROJECT_SOURCE_DIR}/include/")
LINK_DIRECTORIES("${PROJECT_SOURCE_DIR}/lib/")

add_executable(${TARGET} main.c)
target_link_libraries(${TARGET} orig)

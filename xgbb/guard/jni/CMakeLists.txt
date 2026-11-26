cmake_minimum_required(VERSION 3.18)
project(piupiuguard C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS_RELEASE "-O2 -fvisibility=hidden -fvisibility-inlines-hidden -fomit-frame-pointer -fno-stack-protector -ffunction-sections -fdata-sections -Wl,--gc-sections")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")

add_library(piupiuguard SHARED
        guard.c)

target_include_directories(piupiuguard PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(piupiuguard log)

# 关键加固：strip 符号、隐藏符号表
set_target_properties(piupiuguard PROPERTIES
        LINK_FLAGS "-Wl,-s -Wl,--exclude-libs,ALL -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now"
        OUTPUT_NAME "piupiuguard"
        PREFIX "lib")

# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
# Tool Version Limit: 2025.11
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
cmake_minimum_required(VERSION 3.15)
project(design_1_v_tpg_0_0_v_tpg)
find_package(common)
collector_create (PROJECT_LIB_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}")
collect (PROJECT_LIB_SOURCES xdesign_1_v_tpg_0_0_v_tpg.c)
collect (PROJECT_LIB_SOURCES xdesign_1_v_tpg_0_0_v_tpg_sinit.c)
collect (PROJECT_LIB_SOURCES xdesign_1_v_tpg_0_0_v_tpg_linux.c)
collect (PROJECT_LIB_SOURCES xdesign_1_v_tpg_0_0_v_tpg_g.c)
collector_list (_sources PROJECT_LIB_SOURCES)
collector_create (PROJECT_LIB_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}")
collect (PROJECT_LIB_HEADERS xdesign_1_v_tpg_0_0_v_tpg.h)
collect (PROJECT_LIB_HEADERS xdesign_1_v_tpg_0_0_v_tpg_hw.h)
collector_list (_headers PROJECT_LIB_HEADERS)
file(COPY ${_headers} DESTINATION ${CMAKE_BINARY_DIR}/include)
include_directories(${CMAKE_BINARY_DIR}/include)
add_library(design_1_v_tpg_0_0_v_tpg STATIC ${_sources})
set_target_properties(design_1_v_tpg_0_0_v_tpg PROPERTIES LINKER_LANGUAGE C)


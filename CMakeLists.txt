# <Copyright Holder>. Copyright (C) <Copyright Year(s)>. <License>.

#
# Project Properties
#
cmake_minimum_required(VERSION 3.1)
project(projectname)
set(APPLICATION_NAME "Project Name")
set(APPLICATION_CODENAME "${PROJECT_NAME}")
set(APPLICATION_COPYRIGHT_YEARS "2018")
set(APPLICATION_VERSION_MAJOR 1)
set(APPLICATION_VERSION_MINOR 0)
set(APPLICATION_VERSION_PATCH 0)
set(APPLICATION_VERSION_TYPE SNAPSHOT)
set(APPLICATION_VERSION_STRING "${APPLICATION_VERSION_MAJOR}.${APPLICATION_VERSION_MINOR}.${APPLICATION_VERSION_PATCH}-${APPLICATION_VERSION_TYPE}")
set(APPLICATION_VENDOR_ID "com.yourcompany")
set(APPLICATION_VENDOR_NAME "Your Company")
set(APPLICATION_VENDOR_URL "yourcompany.com")
set(APPLICATION_ID "${APPLICATION_VENDOR_ID}.${PROJECT_NAME}")

#
# Debugging Options
#
set(CMAKE_VERBOSE_MAKEFILE OFF)

#
# Compile flags
#
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "-Wall")
set(CMAKE_CXX_FLAGS_DEBUG "-g")

#
# Project Output Paths
#
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin")
set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}/lib")

#
# Project Search Paths
#
set(MAINFOLDER ${PROJECT_SOURCE_DIR})
list(APPEND CMAKE_PREFIX_PATH "${MAINFOLDER}")
list(APPEND CMAKE_PREFIX_PATH "${MAINFOLDER}/tools")
list(APPEND CMAKE_PREFIX_PATH "${MAINFOLDER}/third_party")
set(CMAKE_MODULE_PATH "${MAINFOLDER}/tools/share/cmake")
include_directories("${MAINFOLDER}/src")
include_directories("${MAINFOLDER}/tests/")

#
# Locate Project Prerequisites
#
# find_package(Protobuf REQUIRED)
# include_directories(${Protobuf_INCLUDE_DIRS})

#
# Other Variables
#
set(TOP_NAMESPACE "namespace")

#
# Add Build Targets
#
add_subdirectory(src)
add_subdirectory(tests)

#
# Add Install Targets
#
if(EXISTS "${MAINFOLDER}/src/${TOP_NAMESPACE}" AND IS_DIRECTORY "${MAINFOLDER}/src/${TOP_NAMESPACE}")
  file(GLOB_RECURSE project_headers *.h *.hpp)
  install(FILES ${project_headers} DESTINATION "include/${TOP_NAMESPACE}")
endif(EXISTS "${MAINFOLDER}/src/${TOP_NAMESPACE}" AND IS_DIRECTORY "${MAINFOLDER}/src/${TOP_NAMESPACE}")

cmake_minimum_required(VERSION 3.0)

project(ccv_probation)
set(CMAKE_BUILD_TYPE Debug)

#set(OpenCV_SEARCH_PATH "" CACHE PATH "Prefix prepended to install directories")
#set(QT_SEARCH_PATH "" CACHE PATH "Prefix prepended to install directories")
set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${QT_SEARCH_PATH} ${OpenCV_SEARCH_PATH})
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

IF(CMAKE_VERSION VERSION_EQUAL "3.0.0" OR
   CMAKE_VERSION VERSION_GREATER "3.0.0")
 CMAKE_POLICY(SET CMP0045 OLD)  # suppress set_target_properties empty target warnning
 CMAKE_POLICY(SET CMP0026 OLD)  # suppress set_target_properties read LOCATION warnning
ENDIF()

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(BUILD_STATIC_LIBS ON)
# default out of source build
if( CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR )
    message( FATAL_ERROR "Please select another Build Directory ! (and give it a clever name, like bin_Visual2012_64bits/)" )
endif()
if( CMAKE_SOURCE_DIR MATCHES " " )
    message( "Your Source Directory contains spaces. If you experience problems when compiling, this can be the cause." )
endif()
if( CMAKE_BINARY_DIR MATCHES " " )
    message( "Your Build Directory contains spaces. If you experience problems when compiling, this can be the cause." )
endif()

set(3rd_root  "${CMAKE_CURRENT_SOURCE_DIR}/3rd")

#find_package( OpenCV REQUIRED )
#set(QTDIR ${QT_SEARCH_PATH}/bin)
set(bin_dirs ${bin_dirs} ${QTDIR})
set(OpenCV_BIN_DIR ${OpenCV_CONFIG_PATH}/${OpenCV_ARCH}/${OpenCV_RUNTIME}/bin/)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)


set(DATA_DIR ${CMAKE_CURRENT_SOURCE_DIR}/data)

include(CreateLaunchers)
set(DATA_DIR ${CMAKE_CURRENT_SOURCE_DIR}/data)
configure_file(
	config.hpp.in 
	${CMAKE_CURRENT_BINARY_DIR}/config.hpp
	)
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib)	
add_subdirectory(lib)
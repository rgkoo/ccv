# - Find icp
# Intel Threading Building Blocks offers a rich and complete approach to expressing parallelism in a C++ program
# www.threadingbuildingblocks.org
#
# The module defines the following variables:
#  ICP_FOUND - the system has icp
#  ICP_INCLUDE_DIR - where to find icp.h
#  ICP_INCLUDE_DIRS - icp includes
#  ICP_LIBRARY - where to find the icp library
#  ICP_LIBRARIES - aditional libraries

set(ICP_ROOT_DIR ${ICP_ROOT})

# set ICP_INCLUDE_DIR
find_path (ICP_INCLUDE_DIR
  NAMES
    icp.h icp.hpp
  PATHS
    "${ICP_ROOT}/include"
  DOC
    "icp include directory"
)

# set ICP_INCLUDE_DIRS
set (ICP_INCLUDE_DIRS ${ICP_INCLUDE_DIR})


IF (ICP_INCLUDE_DIR)
  IF (WIN32)
     SET(ICP_LIBRARY_DIR "${ICP_INCLUDE_DIR}/../lib")
  ELSE (WIN32)
     SET(ICP_LIBRARY_DIR "${ICP_INCLUDE_DIR}/../lib/libicp")
  ENDIF (WIN32)

  FIND_LIBRARY(ICP_CORE_LIBRARY_RELEASE NAMES icp PATHS ${ICP_LIBRARY_DIR})
  SET(ICP_LIBRARY_RELEASE
    ${ICP_CORE_LIBRARY_RELEASE})
      
  FIND_LIBRARY(ICP_CORE_LIBRARY_DEBUG NAMES icpd PATHS ${ICP_LIBRARY_DIR})
  SET(ICP_LIBRARY_DEBUG
    ${ICP_CORE_LIBRARY_DEBUG})
ENDIF (ICP_INCLUDE_DIR)

if(ICP_LIBRARY_RELEASE)
  if(ICP_LIBRARY_DEBUG)
    set(ICP_LIBRARIES_ optimized ${ICP_LIBRARY_RELEASE} debug ${ICP_LIBRARY_DEBUG})
  else()
    set(ICP_LIBRARIES_ ${ICP_LIBRARY_RELEASE})
  endif()

  set(ICP_LIBRARIES ${ICP_LIBRARIES_} CACHE FILEPATH "The ICP library")
endif()

IF(ICP_INCLUDE_DIR AND ICP_LIBRARIES)
  SET(ICP_FOUND TRUE)
  MESSAGE(STATUS "Found OpenMesh: ${ICP_LIBRARIES}")
ENDIF(ICP_INCLUDE_DIR AND ICP_LIBRARIES)

find_package_handle_standard_args (icp DEFAULT_MSG ICP_LIBRARIES
  ICP_INCLUDE_DIR
  ICP_INCLUDE_DIRS
  ICP_ROOT_DIR
)


mark_as_advanced (
  ICP_LIBRARIES
  ICP_INCLUDE_DIR
  ICP_INCLUDE_DIRS
  ICP_ROOT_DIR
)


set(target ccv)
file(GLOB_RECURSE _headers *.h *.hpp)
file(GLOB_RECURSE _sources *.cpp *.cc *.c *.cu)
SET_SOURCE_FILES_PROPERTIES( _sources PROPERTIES LANGUAGE CXX )
add_library(${target} 
	${_headers}
	${_sources})


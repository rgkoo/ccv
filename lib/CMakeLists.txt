set(target ccvlib)
file(GLOB_RECURSE _headers *.h *.hpp)
file(GLOB_RECURSE _sources *.cpp *.cc *.c *.cu)

add_library(${target} 
	${_headers}
	${_sources})


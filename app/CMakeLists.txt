set(target started)
add_executable(${target} 
	started.cpp
)
target_link_libraries(${target} ccv png jpeg)

set(target face_detection)
add_executable(
	${target}
face_detection.cpp)
target_link_libraries(${target} ccv png jpeg ${CMAKE_DL_LIBS} ${OpenCV_LIBS})

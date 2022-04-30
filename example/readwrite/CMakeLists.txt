file(GLOB_RECURSE SOURCES
		./*.h
		./*.c
)

add_executable(readExample ${SOURCES})

target_link_libraries(readExample
#		PRIVATE read-register
#		PRIVATE ${CMAKE_THREAD_LIBS_INIT}
)

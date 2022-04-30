file(GLOB_RECURSE SOURCES
  ./*.h
  ./*.c
)

add_library(read-register ${SOURCES})

target_include_directories(read-register PUBLIC /usr/local/opt/qemu/include)
#target_include_directories(read-write-register
#  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
#)


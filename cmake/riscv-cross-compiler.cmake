message(STATUS "ARM GCC raspian buster toolchain CMAKE_MAKE_PROGRAM: ${CMAKE_MAKE_PROGRAM}")

set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR rv64id)
SET(CMAKE_SYSTEM_VERSION 1)
SET(CMAKE_CROSSCOMPILING TRUE)
set(CMAKE_C_COMPILER_WORKS 1)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH /opt/riscv/riscv64-unknown-elf)

SET(RISCV_TOOLCHAIN_BIN_PATH /opt/riscv/bin)
SET(RISCV_TOOLCHAIN_PREFIX riscv64-unknown-elf)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER ${RISCV_TOOLCHAIN_BIN_PATH}/${RISCV_TOOLCHAIN_PREFIX}-gcc)
SET(CMAKE_CXX_COMPILER ${RISCV_TOOLCHAIN_BIN_PATH}/${RISCV_TOOLCHAIN_PREFIX}-g++)
set(CMAKE_AR ${RISCV_TOOLCHAIN_BIN_PATH}/${RISCV_TOOLCHAIN_PREFIX}-ar)
SET(CMAKE_LIBRARY_ARCHITECTURE /opt/riscv/riscv64-unknown-elf)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# We must set the OBJCOPY setting into cache so that it's available to the
# whole project. Otherwise, this does not get set into the CACHE and therefore
# the build doesn't know what the OBJCOPY filepath is
set(CMAKE_OBJCOPY ${RISCV_TOOLCHAIN_BIN_PATH}/${RISCV_TOOLCHAIN_PREFIX}-objcopy CACHE FILEPATH "The toolchain objcopy command " FORCE )

set(CMAKE_OBJDUMP ${RISCV_TOOLCHAIN_BIN_PATH}/${RISCV_TOOLCHAIN_PREFIX}-objdump CACHE FILEPATH "The toolchain objdump command " FORCE )

#SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Os -march=${CMAKE_SYSTEM_PROCESSOR} -mabi=lp64d")
#SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Os -march=${CMAKE_SYSTEM_PROCESSOR} -mabi=lp64d")
#set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -Os -march=${CMAKE_SYSTEM_PROCESSOR} -mabi=lp64d")
set(CMAKE_EXE_LINKER_FLAGS "-T ${PROJECT_SOURCE_DIR}/env/riscv.lds" )

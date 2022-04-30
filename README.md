# riscv-fuzzing

## Pre-requisite

One must have `qemu` installed as well as its toolchain. The toolchain can be found at https://github.com/riscv-collab/riscv-gnu-toolchain.
A good document on how to install it can be found at https://medium.com/@kurun_pan/risc-v-how-to-install-toolchain-for-macos-d41671e83c42.
Ps. No need to export the cross-compiler bin to the path. 

## Getting started

```
git clone <repo-url>
cd riscv-fuzzing
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/riscv-cross-compiler.cmake ..
make
```
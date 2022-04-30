#include "api-ext.h"

void *qemu_get_cpu(int index);

static uint32_t get_cpu_register(unsigned int cpu_index, unsigned int reg) {
    uint8_t* cpu = qemu_get_cpu(cpu_index);
    return *(uint32_t*)(cpu + 33488 + 5424 + reg * 4);
}
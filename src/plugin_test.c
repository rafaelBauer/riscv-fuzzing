#include <inttypes.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>
//#include <glib.h>

#include "api-ext.h"

#include <qemu-plugin.h>

QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;

#define CPU_SIZE 32
static uint32_t cpu_num;
static uint32_t cpu_value[CPU_SIZE]={0};

static void vcpu_insn_exec_before(unsigned int cpu_index, void *)
{
    for (size_t i = 0; i < cpu_num; i++)
    {
        /* code */
        for (size_t j = 0; j < CPU_SIZE; i++)
        {

            if(cpu_value[j] != get_cpu_register(i,j)) {
                // The value of cpu has changed
                printf("The value of cpu has changed");
            } else {
                // The value of cpu has not changed
                printf("The value of cpu has not changed");
            }
        }

    }
}

static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
{
    size_t n = qemu_plugin_tb_n_insns(tb);
    size_t i;

    for (i = 0; i < n; i++) {
        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
        qemu_plugin_register_vcpu_insn_exec_cb(
                insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS, NULL);
    }
}

static void plugin_exit(qemu_plugin_id_t id, void *p)
{
}

QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                           const qemu_info_t *info,
                                           int argc, char **argv)
{
    if(info->system_emulation) {
        cpu_num = info->system.smp_vcpus;
    } else {
        cpu_num = 1;
    }

    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
    return 0;
}
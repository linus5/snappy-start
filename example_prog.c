
static int my_errno;

#define SYS_ERRNO my_errno
#include "linux_syscall_support.h"


void _start() {
  static const char string[] = "In example_prog.c!\n";
  sys_write(1, string, sizeof(string) - 1);
  sys_exit_group(0);
}
#include <stdlib.h>
#include <errno.h>

#define _unused_ __attribute__((unused))

struct udev;
struct udev_queue;

__attribute__ ((visibility("default")))
const char *udev_get_run_path(_unused_ struct udev *a) {
  return "/run/udev";
}

__attribute__ ((visibility("default")))
const char *udev_get_sys_path(_unused_ struct udev *a) {
  return "/sys";
}

__attribute__ ((visibility("default")))
const char *udev_get_dev_path(_unused_ struct udev *a) {
  return "/dev";
}

__attribute__ ((visibility("default")))
struct udev_list_entry *udev_queue_get_failed_list_entry(_unused_ struct udev_queue *a) {
  errno = ENOSYS;
  return NULL;
}

__attribute__ ((visibility("default")))
struct udev_monitor *udev_monitor_new_from_socket(_unused_ struct udev *a, _unused_ const char *b) {
  errno = ENOSYS;
  return NULL;
}

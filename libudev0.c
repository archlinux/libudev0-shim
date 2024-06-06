#include <stdlib.h>
#include <errno.h>

#define _unused_ __attribute__((unused))

struct udev;
struct udev_queue;

__attribute__ ((visibility("default")))
const char *udev_get_run_path(struct udev *a)
{
    if (a == NULL)
        return NULL;
    return "/run/udev";
}

__attribute__ ((visibility("default")))
const char *udev_get_sys_path(struct udev *a)
{
    if (a == NULL)
        return NULL;
    return "/sys";
}

__attribute__ ((visibility("default")))
const char *udev_get_dev_path(struct udev *a)
{
    if (a == NULL)
        return NULL;
    return "/dev";
}

__attribute__ ((visibility("default")))
struct udev_list_entry *udev_queue_get_failed_list_entry(_unused_ struct udev_queue *a)
{
    /*
     * Seemingly upstream never checked if the udev_queue arg is NULL, so don't
     * check here either.
     */
    errno = ENOSYS;
    return NULL;
}

__attribute__ ((visibility("default")))
struct udev_monitor *udev_monitor_new_from_socket(struct udev *a, const char *b)
{
    if (a == NULL)
        return NULL;
    if (b == NULL)
        return NULL;

    errno = ENOSYS;
    return NULL;
}

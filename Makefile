CFLAGS := -Wall -Wextra -g -fvisibility=hidden -shared -fPIC $(CFLAGS)
LDFLAGS := -Wl,-soname,libudev.so.0 -Wl,-z,now $(LDFLAGS)
LDLIBS := -ludev
abi_version := 0.13.9999

default: all

all: \
	libudev.so.$(abi_version)

libudev.so.$(abi_version): libudev0.c
	$(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) $^ -o $@

clean:
	$(RM) libudev.so.$(abi_version)

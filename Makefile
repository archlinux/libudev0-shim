CFLAGS := -Wall -Wextra -g -fvisibility=hidden -shared -fPIC $(CFLAGS)
LDFLAGS := -Wl,-soname,libudev.so.0 -Wl,-z,now $(LDFLAGS)
LDLIBS := -ludev

default: all

all: \
	libudev.so.0.0.9999

libudev.so.0.0.9999: libudev0.c
	$(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) $^ -o $@

clean:
	$(RM) libudev.so.0.0.9999

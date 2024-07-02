CFLAGS := -Wall -Wextra -g -fvisibility=hidden -shared -fPIC $(CFLAGS)
LDFLAGS := -Wl,-soname,libudev.so.0 -Wl,-z,now $(LDFLAGS)
LDLIBS := -Wl,--no-as-needed -ludev -Wl,--as-needed
abi_version := 0.13.9999
prefix := /usr
libdir := $(prefix)/lib

default: all

all: \
	libudev.so.$(abi_version)

libudev.so.$(abi_version): libudev0.c
	$(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) $^ -o $@

install: libudev.so.$(abi_version)
	install -D -m0755 libudev.so.$(abi_version) $(DESTDIR)$(libdir)/libudev.so.$(abi_version)
	ln -s libudev.so.$(abi_version) $(DESTDIR)$(libdir)/libudev.so.0

clean:
	$(RM) libudev.so.$(abi_version)

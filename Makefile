prefix ?= /usr
libdir ?= $(prefix)/lib

abi_version := 0.13.9999
soname := 0

CFLAGS += -Wall -Wextra -g -fvisibility=hidden -fPIC
LDFLAGS += -shared -Wl,-soname,libudev.so.$(soname) -Wl,-z,now
LDLIBS += -Wl,--no-as-needed -ludev -Wl,--as-needed

.PHONY: default all install clean

default: all

all: libudev.so.$(abi_version)

libudev.so.$(abi_version): libudev0.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ $(LDLIBS) -o $@

install: libudev.so.$(abi_version)
	install -D -m0755 $< $(DESTDIR)$(libdir)/libudev.so.$(abi_version)
	ln -sf libudev.so.$(abi_version) $(DESTDIR)$(libdir)/libudev.so.$(soname)

clean:
	$(RM) libudev.so.$(abi_version)


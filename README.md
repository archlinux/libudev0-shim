# Overview

This project provides a compatibility library libudev.so.0, for systems which
only have libudev.so.1.

# Operation

With libudev.so.1 a few functions have been removed from the ABI. Those have
been implemented (as stubs) in this project.

Other API and ABI is implicitly forwarded to libudev.so.1, which the shim
directly links to. Since the shim itself does not use anything from
libudev.so.1, one needs to ensure the linker does not discard it. For that
the "-Wl,--no-as-needed -ludev" flag is used.

KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
M ?= $(shell pwd)

.PHONY: default modules modules_install clean

default: modules

modules modules_install clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M)/driver $@

OpenVFDService: OpenVFDService.c
	$(CC) $(CFLAGS) -Wall -w -o $@ $^ -lm -lpthread $(LDFLAGS)

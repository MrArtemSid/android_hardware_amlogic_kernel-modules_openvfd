ifneq ($(KERNELRELEASE),)
ccflags-y += -Wno-switch
obj-m := openvfd.o
openvfd-y := \
	driver/protocols/i2c_sw.o \
	driver/protocols/i2c_hw.o \
	driver/protocols/spi_sw.o \
	driver/controllers/dummy.o \
	driver/controllers/seg7_ctrl.o \
	driver/controllers/fd628.o \
	driver/controllers/fd650.o \
	driver/controllers/hd44780.o \
	driver/controllers/gfx_mono_ctrl.o \
	driver/controllers/ssd1306.o \
	driver/controllers/pcd8544.o \
	driver/controllers/il3829.o \
	driver/openvfd_drv.o
else
KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
M ?= $(shell pwd)

.PHONY: default modules modules_install clean

default: modules

modules modules_install clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $@
endif

OpenVFDService: OpenVFDService.c
	$(CC) $(CFLAGS) -Wall -w -o $@ $^ -lm -lpthread $(LDFLAGS)

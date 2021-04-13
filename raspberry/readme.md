# Raspberry PI Builds

## U-boot
First step that you need is get U-boot source code. You can get clone this [git](https://github.com/u-boot/u-boot).

After that, configure and compile U-boot to raspberry using respectively:

1. Raspberry Pi Zero W
```
$ make rpi_0_w_defconfig
```
2. Raspberry Pi 3
```
$ make rpi_3_32b_defconfig
```
So, compile using cross compile:
```
$ make CROSS_COMPILE=arm-linux-gnueabihf- -j$(nproc)
```

To boot kernel properly using u-boot, it's necessary create a file with boot arguments as following.  
**Note:** You have to include a device-tree of your board, on the example below it's used to rpi zero.
```
mmc dev 0
fatload mmc 0:1 ${kernel_addr_r} zImage
fatload mmc 0:1 0x2000000 bcm2835-rpi-zero-w.dtb
setenv bootargs 8250.nr_uarts=1 root=/dev/mmcblk0p2 rootwait console=ttyS0,115200
bootz ${kernel_addr_r} - 0x2000000
```
You can named as *boot.cmd*. But, u-boot only read *.scr* file. To create this file, run the following command to use a mkimage from u-boot.
```
$ tools/mkimage -C none -A arm -T script -d boot.cmd boot.scr
```

**Note:** Even if you pass *bcm2835-rpi-zero-w.dtb* on bootloader, you need to include the *bcm2708-rpi-zero-w.dtb* on boot partition. 
This device-tree blob is used by Raspberry pi to configure UART. If you don't include it, you not be able to see U-boot serial output

## Linux Kernel
Clone this [git](https://github.com/raspberrypi/linux) to get Linux Kernel source code for Raspberry Pi.
```
$ git clone https://github.com/raspberrypi/linux
```

To initiate the compile process, it is a good idea to clean the previous configs if its exists. This can be done by the following command:
```
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
```

Run the following command to create .config file. That file will set the build configurations.

Pi Zero W:
```
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2835_defconfig
```
Then, to build use the following command:
```
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs -j$(nproc)
```
The -j$(nproc) command will use all core of your computer to compile. If you would like to use less, change $(nproc) to the number of cores.

## How to prepare the SD Card
The following files are necessary to boot the Raspberry Pi. They are GPU firmware and bootloader. 
* bootcode.bin
* start.elf
* fixup.dat

You can download these file from [https://github.com/raspberrypi/firmware/tree/master/boot](https://github.com/raspberrypi/firmware/tree/master/boot)

```
$ wget https://github.com/raspberrypi/firmware/raw/master/boot/bootcode.bin
$ wget https://github.com/raspberrypi/firmware/raw/master/boot/start.elf
$ wget https://github.com/raspberrypi/firmware/raw/master/boot/fixup.dat
```

You also need *config.txt* file (Contents system configuration parameters) and *cmdline.txt* file (Arguments to Linux Kernel) to boot properly.

These files can be downloaded [here](https://github.com/thalestas/boot-and-compile-process/tree/master/raspberry). The *config.txt* provide only contains a configuration to enable UART but it is enough to work.

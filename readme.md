# Linux Compilation and Boot Process
This repository describe how to compile bootloader, linux kernel and busybox to Raspberry Pi and BeagleBone.

## Toolchain
First, it's necessary to prepare the environment to perform the arm cross compilation. To do so, download Linaro arm toolchain (ex. ``i686_arm-linux-gnueabihf.tar.xz`` for 32bit machine or ``x86_64_arm-linux-gnueabihf.tar.xz`` for 64bit machine ) [here](https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/).

After download, export the path of the cross compilation toolchain in **.bashrc** including the following line in the end of the file.
```
export PATH=$PATH:<YOUR_EXTRACT_PATH>/gcc-linaro-<VERSION>_arm-linux-gnueabihf/bin
```
And run the command bellow to source the file.
```
source .bashrc
```

To test the cross compiler run the command bellow and check the version installed.
```
gcc --version
```
It is necessary to install the following dependencies too:
```
sudo apt-get install bison flex libssl-dev
```



## BeagleBone
- [Compilations](#beaglebone-compilations) - Describe BeagleBone U-boot, Linux Kernel and BusyBox compilations.

## Raspberry Pi
- [Compilations](#raspberry-pi-compilations) - Describe Raspbeery Pi U-boot, Linux Kernel and BusyBox compilations.

# BeagleBone Compilations

## U-boot
1. Clone the source code of u-boot.
```
git clone https://github.com/u-boot/u-boot
```

# Raspberry PI Compilations
## Linux Kernel
The first thig that is necessary is Clone this [git](https://github.com/raspberrypi/linux) to get Linux Kernel source code for Raspberry Pi.
```
git clone https://github.com/raspberrypi/linux
```

To initiate the compile process, it is a good idea to clean the previous configs if its exists. This can be done by the following command:
```
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
```

Run the following command to create .config file. That file will set the build configurations.

For Pi 1, Pi Zero and Pi Zero W:
```
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcmrpi_defconfig
```

For Pi 2, Pi 3 and Pi 3+:
```
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2709_defconfig
```

Than, to build use the following command:
```
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs -j$(nproc)
```
The -j$(nproc) command will use all core of your computer to compile. If you would like to use less, change $(nproc) to the number of cores.

## How to prepare the SD Card
The following files are necessary to boot the Raspberry Pi. They are GPU firmware and bootloader. They are alrey provide by Raspberry Org.
* bootcode.bin
* start.elf
* fixup.dat

You can download these file from [https://github.com/raspberrypi/firmware/tree/master/boot](https://github.com/raspberrypi/firmware/tree/master/boot)

You also need *config.txt* file (Contents system configuration parameters) and *cmdline.txt* file (Arguments to Linux Kernel) to boot properly.

These files can be downloaded [here](https://github.com/thalestas/boot-and-compile-process/tree/master/raspberry). The *config.txt* provide only contains a configuration to enable UART but it is enough to work.

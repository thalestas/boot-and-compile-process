# Linux Build and Boot Process
This page  describe how to compile bootloader, linux kernel and busybox to Raspberry Pi and BeagleBone.

## Toolchain
First, it's necessary to prepare the environment to perform ARM cross compilation. To do so, download Linaro ARM toolchain (ex. ``i686_arm-linux-gnueabihf.tar.xz`` for 32bit machine or ``x86_64_arm-linux-gnueabihf.tar.xz`` for 64bit machine ) [here](https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/).

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
- [Build](#beaglebone-builds) - Describe BeagleBone U-boot, Linux Kernel and BusyBox Builds.

## Raspberry Pi
- [Build](raspberry/readme.md) - Describe Raspberry Pi U-boot, Linux Kernel and BusyBox Builds.

## DragonBoard 410c
- [Build](#d410c-builds) - Describe DragonBoard 410c U-boot, Linux Kernel and BusyBox Builds.

# BeagleBone Builds

## U-boot
1. Clone the source code of u-boot.
```
git clone https://github.com/u-boot/u-boot
```


# DragonBoard 410c Builds

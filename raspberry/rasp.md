# Raspberry PI Compilations
## Linux Kernel
Clone this [git](https://github.com/raspberrypi/linux).
```
git clone https://github.com/raspberrypi/linux
```

To initiate the compile process, it good idea to clean the previous configs if its exists. This can be done by the following command:
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
The following files are necessary to boot the Raspberry Pi. They are GPU firmware and bootloader
* bootcode.bin
* start.elf
* fixup.dat

You can download these file from [https://github.com/raspberrypi/firmware/tree/master/boot](https://github.com/raspberrypi/firmware/tree/master/boot)

You also need *config.txt* file (Contents system configuration parameters) and *cmdline.txt* file (Arguments to Linux Kernel) to boot properly.

These files can be downloaded **here** (jaja nos adiciona :))

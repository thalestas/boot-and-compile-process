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



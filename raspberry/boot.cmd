setenv fdtfile bcm2835-rpi-zero-w.dtb
mmc dev 0
fatload mmc 0:1 ${kernel_addr_r} zImage
fatload mmc 0:1 ${fdt_addr_r} ${fdtfile}
setenv bootargs console=tty1 console=ttyAMA0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
bootz ${kernel_addr_r} - ${fdt_addr_r}

## Compile db410c Android Kernel
Kernel Repo: https://git.linaro.org/people/amit.pundir/linux.git  
Branch: db410c-android-mainline-tracking  
Steps: 
```
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- distclean
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- db410c_defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc)
```

## ADS1115 Device Driver
1- Include ADS1115 Device Tree node:  

File: ```arc/arm64/boot/dts/qcom/apq8016-sbc.dtsi```  
Node: 
```
ads1015@49 {
	compatible = "ti,ads1015";
	reg = <0x49>;
	address-cells = <1>;
	size-cells = <0>;
};
```

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

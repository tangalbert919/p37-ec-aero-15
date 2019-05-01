# Fan control register values for the Aero 14Kv8
This file briefly describes the fan control registers of the embedded controller
(EC) of the Gigabyte Aero 14Kv8 Laptop (the Aero 14 model with Core i7-8750H 
processor).

*ALL OF THIS INFORMATION IS UNOFFICIAl AND WITHOUT WARRANTY.*

This information is based on what I understood by analyzing the EC registers.
It is not official information and I ask you to please be careful when manipulating
EC register values.

The register explanations below have the following format
 RR.B = value

* RR: stands for the register address of the EC - for example 0C
* .B: stands for one bit in this register, counting the bits from 0 to 7. If the bit reference is missing then the value refers to the whole byte and not just to a single bit
* value: stands for the value. If the address is for a single bit then the value can of course only be 0 or 1, if the address is for a whole byte then the value can be from 00 to FF. 


## Normal fan mode 
This is the default fan mode where the fan is always spinning at minimum speed 
even if the CPU and GPU have low temperatures. 

The default mode is active if all the special mode bits (i.e., 08.6 and 0C.4 and 0D.0) are set to 0.

Register states for normal mode:
```
 08.6=0 (quiet mode off)
 0C.4=0 (gaming mode off)
 0D.0=0 (custom mode off)
```

## Quiet fan mode 
In this mode the fan will be off completely when the CPU and GPU are cool enough.

Register states for quiet mode:
```
 08.6=1 (quiet mode on)
 0D.0=0 (custom mode off)
 0C.4=0 (gaming mode off)
```
 
## Gaming fan mode
In this mode the fan is always spinning at minimum speetd even if the CPU  and GPU
have low temperatures and the fan will switch to higher speeds more quickly.
 
Register states for gaming mode:
```
 08.6=0 (quiet mode off)
 0D.0=0 (custom mode off)
 0C.4=1 (gaming mode off)
```

## Custom fan mode 'auto maximum'
In this mode the fan is always spinning at minimum speed even if the CPU  and GPU
have low temperatures. If there are higher temperatures then the fan will not go 
above a certain maximum speed (instead, the components will be hotter and will 
eventually do thermal throttling). 

Register states for custom auto-maximum mode:
```
 06.4=0 (custom mode type: auto-maximum) 
 08.6=0 (quiet mode off)
 0C.4=0 (gaming mode off)
 0D.0=1 (custom mode on)
```

The registers B0 and B1 contain the maximum speed for the fan. 
Both registers must be set to identical values.

The mapping between hex values for the registers and percent in fan speed are as follows
* 44 -> 30%
* 50 -> 35%
* 5B -> 40%
* 67 -> 45%
* 72 -> 50%
* 7D -> 55%
* 89 -> 60%
* 94 -> 65%
* A0 -> 70%
* AB -> 75%
* B7 -> 80%
* C2 -> 85%
* CE -> 90%
* D9 -> 95%
* E5 -> 100%


So to set the fan to 50% maximum speed one would have to set the following register values
```
 06.4=0
 08.6=0
 0C.4=0
 0D.0=1
 B0=72
 B1=72
```

Warning: do not set values below 30%! The fan-speeds seem to be controlled with pulse-width modulation; it is not safe to use values below 30%!


## Custom fan mode 'fixed mode'
This mode sets the fans to a constant speed, independent of the temperature.

Register states for custom fixed maximum mode:
```
 06.4=1 (custom mode type: fixed speed) 
 08.6=0 (quiet mode off)
 0C.4=0 (gaming mode off)
 0D.0=1 (custom mode on)
```


As for the previous mode, the fan speed is controlled with registers B0 and B1. 
Again, it is impossible to use values below 30%.
The value 00 is accepted and turns the fans off completely but this may not be 
safe because your hardware could overheat so it seems like a very bad idea unless
one writes some kind of thermal monitor that wants to control the fans directly
based on its own temperature curve.

So to set the fan to 50% fixed speed one would have to set the following register values
```
 06.4=1
 08.6=0
 0C.4=0
 0D.0=1
 B0=72
 B1=72
```


## Custom fan mode 'deep control'
The Gigabyte "Smart Manager" software also has a "deep control" mode where one can draw a fan speed curve 
to set the desired fan speeds in relation to different temperatures.

This mode seems to be controlled through bit 0D.7

The register flags which activate this mode are as follows:
```
 06.4=1 (not sure if the value of this bit matters or not if 0D.7 is set to 1)
 08.6=0 (quiet mode off)
 0C.4=0 (gaming mode off)
 0D.0=1 (custom mode on)
 0D.7=1 (deep control mode on)
```

It is not clear how and where the custom fan control curve is stored.

## Keyboard backlight
The keyboard backlight is controlled by register D7.
It has three possible values
* 00 -> Backlight off
* 01 -> Backlight level 1
* 02 -> Backlight level 2 (bright)

E.g. setting `D7=02` turns the keyboard backlight to the brighter of the two levels.

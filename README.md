# Overview
This project provides a capability to control the fan of Gigabyte Aero 14Kv8 laptop
(i.e., the Aero 14 model with i7-8750H).

This program is based on the work of Jason Ertel at https://github.com/jertel/p37-ec 
who wrote a program for some older Gigabyte Laptop models.

This pgoram monitors and controls the embedded controller (EC) on of the Laptop

The EC is responsible for auto-adjusting the fan speed, however,this functionality 
is not activated by default. Therefore, the fan is running all the time.

Using this program you can adjust the fan settings similarly to what is available 
via Gigabyte's SmartManager tool on the Windows operating system.

Additionally, there are other values that can be read and adjusted, such as the
ambient light sensor, keyboard backlight setting, temperatures, as well as wifi,
bluetooth, camera, touchpad, and even USB charge capabilities during sleep and
hibernate.

However, the source code in this project is command-line accessible only, and users
must be cautious of any modifications to the EC registers. Because this program
allows any value to be written to any register it is possible to cause undesired
results, with potentially physically damaging results. Therefore, do not use this
program unless you accept the risks mentioned above.

# Compilation
First, ensure g++ is available on your distribution. Then compile via the
following command:
`g++ src/p37ec-aero.c -o bin/p37ec-aero`

# Usage
The program may have permission errors even if it is run with sudo.
If this is the case then you may need to change your UEFI/Bios settings to
disable any trusted computing functionality and to delete the secure boot
keys (don't worry, there is an option to reset those keys to their default
values should you need secure boot again in the future).

To run and view current EC values (and enable the EC fan controller):
`sudo bin/p37ec-aero`

Once the above command is executed you will see output similar to the following:
```
  Usage: sudo bin/p37ec-aero [<hex-offset[.bit]> <hex-value>]
    Ex: sudo bin/p37ec-aero 0x01.6 0x07

  Current Embedded Controller Values:
    CPU Temp                    [0x60]:   32 C
    GPU Temp                    [0x61]:   0 C
    MLB Temp                    [0x62]:   25 C
    Fan0 Speed                  [0xFC]:   2301 RPM
    Fan1 Speed                  [0xFE]:   2269 RPM
    Fan Control Enabled         [0x13.3]: 1
    Fan Quiet Mode Enabled      [0x08.6]: 1
    Fan Gaming Mode Enabled     [0x12.4]: 0
    Fan Custom Mode Enabled     [0x13.0]: 0
    Fan0 Custom Speed Setting   [0xB0]:   35%
    Fan1 Custom Speed Setting   [0xB1]:   35%
```
The hexadecimal value in the square brackets is the offset within the EC for that 
register. The 0x13.3 notation means bit 3 (starting at 0 from right to left) of 
register 0x13.

To modify an EC register (Ex: turn on quiet mode):
`sudo bin/p37ec-aero 0x08.6 1`

There are also sample scripts for switching between normal mode, gaming mode
and silent mode. However, like this program in general, those scripts should only 
be used if you have the laptop model for which this program was written.

#Be Careful
*This project comes without any warranty*
If you have a different laptop model than the one for which this program is 
intended then first double-check the correct EC register values by observing 
what the Windows fan control program is writing into the EC registers. 
Laptop EC registers can be monitored on Windows with the program
RWEverything.

Writing values into the wrong registers may damage your laptop!

# Disclaimer 
*This project is not affiliated with GIGA-BYTE Technology Co. Ltd.*

# Mimas V2 Replacement Firmware

From here: https://github.com/jimmo/numato-mimasv2-pic-firmware

## Installation

Run the install.sh script

> sudo ./install.sh

## Flashing the PIC

Connect a jumper to the FWUP header (just above the left-most seven-segment). Power up the board and it should show up as a HID device (the Microchip HID bootloader).

```
$ lsusb
...
Bus 001 Device 052: ID 04d8:003c Microchip Technology, Inc.
...
```

Verify mphidflash can find the device:

```
$ mphidflash
USB HID device found: 12288 bytes free
Device family: PIC18
```

Use mphidflash to flash the new code:

```
$ mphidflash -w numato-mimasv2-pic-firmware.production.hex -r
```

Remove the jumper and power-cycle the board.

## Flashing the FPGA

This install.sh script installs everything you need including putting the programmer
on the path, and can be run from the command line as follows:

> mimasv2-prog --filename mydesign.bin

(NB: Mimas-V2 requires the .bin file, not the .bit file)

See the [original project](https://github.com/jimmo/numato-mimasv2-pic-firmware) for flashing the FPGA with `screen` or `minicom`.


## Connecting to the FPGA UART

```
$ screen /dev/ttyACM1 115200
```

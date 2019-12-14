# Mimas V2 Replacement Firmware

From here: https://github.com/jimmo/numato-mimasv2-pic-firmware



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

### Using screen

```
$ screen /dev/ttyACM0
mimas> v
1.0
mimas> i
202015
mimas> f
Ctrl-A :  exec !! sx -k /path/to/flash.bin
```

### Using programmer.py

```
$ python3 -m venv venv
$ . venv/bin/activate
$ pip install pyserial xmodem
$ python3 programmer.py /path/to/flash.bin
```

### Using minicom

```
$ minicom -D /dev/ttyACM0
mimas> v
1.0
mimas> i
202015
mimas> f
Ctrl-A S
```

## Connecting to the FPGA UART

```
$ screen /dev/ttyACM1 115200
```

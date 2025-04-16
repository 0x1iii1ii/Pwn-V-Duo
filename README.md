# Pwn-V-Duo
Another alternative low-cost embedded Linux development board option 
from <a href=https://github.com/0x1iii1ii/PPPwn-Luckfox>Luckfox</a> to run 
PPPwn PS4 exploit on firmware version 11.00 or below.

## Credits

All credit goes to <a href=https://github.com/TheOfficialFloW>TheOfficialFloW</a>, <a href=https://github.com/xfangfang>xfangfang</a>, <a href=https://github.com/SiSTR0>SiSTR0</a> and many other people who contributed to PS4 scene.<br><br>

## Note

- Supports version: `9.00, 9.03, 9.60, 10.00, 10.01, 10.50, 10.70, 10.71, 11.00`
- The average PPPwned time is around `1min - 3min` sometimes it loads under `1 minute`
- Custom built for RISC-V arch using `pppwn` C++ from <a href=https://github.com/xfangfang/PPPwn_cpp>xfangfang</a> <be>

## Support RISC-V Boards

- [x] <b>Milk-V Duo</b><br>
- [ ] <b>Milk-V Duo 256M</b> [WIP] <br>
- [ ] <b>Milk-V Duo S</b> [WIP] <br>
- [ ] <b>LicheeRV Nano</b> [WIP] <br>

## Requirements

- One of devices above
- SD Card 4GB or above
- Ethernet Cable (You need to solder for Duo/Dou 256M)
- USB Type-C
- A USB drive with exFAT32 formatted (only use for the first time to load GoldHEN)
- PC/Laptop for configuration


## Installation

1. Download the image from the official release [here](https://github.com/milkv-duo/duo-buildroot-sdk/releases/download/v1.1.4/arduino-milkv-duo-sd-v1.1.4.img.zip).

2. Use [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/) tool to write the image to the SD card.
3. Plug your device to your PC via USB type-c port and wait a few seconds until you hear the device connect sound.
4. Download <a href=https://drive.google.com/file/d/1pLikKXgdJNWqmylq8UYwXPDGaEDfxjNG>MobaXterm</a> and unzip to use.
    - Open the MobaXterm remote login software, choose Session->SSH, and enter the static IP address: `192.168.42.1`<br>
    - Click OK, enter the login name `root` and password `milkv`
5. You have successfully logged in. Download <a href=https://github.com/0x1iii1ii/Pwn-V-Duo/releases/download/1.0.0/Pwn-V-Duo-v1.0.0.zip>Pwn-V-Duo</a> from release pages or from GitHub repo, unzip and copy folder `Pwn-V-Duo` by drag and drop the files to the `/root` directory in MobaXterm, it will copy the files to the device. <be>
6. After finish copy, paste this cmd, and follow the instructions.

```sh
cd Pwn-V-Duo
chmod +x install.sh
./install.sh
```
Once the device reboots pppwn will run automatically.<be>

## Installation Hardware

1. You simply need to connect the LAN cable from your device (for Milk-V Duo S/LicheeRV Nano else you need to solder ethernet port)
to the PS4 and power the device from the PS4 via a USB Type-C cable or other sources.

## On PS4:<br>

- Go to `Settings` and then `Network`<br>
- Select `Set Up Internet connection` and choose `Use a LAN Cable`<br>
- Choose `Custom` setup and choose `PPPoE` for `IP Address Settings`<br>
- Enter `p` for both `PPPoE User ID` and `PPPoE Password`<br>
- Choose `Automatic` for `DNS Settings` and `MTU Settings`<br>
- Choose `Do Not Use` for `Proxy Server`<br>

## GoldHEN:<br>

- For GoldHEN you need to place the goldhen.bin file onto the root of a USB drive and plug it into the console.<br>
- Once GoldHEN has been loaded for the first time it will be copied to the console's internal HDD and the USB is no longer required.<br>
- To update GoldHEN just repeat the above process and the new version will be copied to the internal HDD. <be>

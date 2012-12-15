#!/bin/sh

#mkbootimg \
#--kernel arch/arm/boot/zImage \
#--ramdisk ~/workspace/kexec_loader/ramdisk.img \
#--cmdline "tegraid=30.1.3.0.0 mem=1024M@2048M vmalloc=128M androidboot.serialno=015d0787943c0004 video=tegrafb no_console_suspend=1 debug_uartport=hsport usbcore.old_scheme_first=1 lp0_vec=8192@0xbcbed000 tegra_fbmem=4098560@0xbdc15000 core_edp_mv=1300 audio_codec=wm8903 tegraboot=sdmmc gpt gpt_sector=62078975 console=tty0 root=/dev/mmcblk0p8" \
#--base 0x10000000 \
#--output boot.img

abootimg --create boot.img -f bootimg.cfg -k arch/arm/boot/zImage -r ~/workspace/kexec_loader/ramdisk.img

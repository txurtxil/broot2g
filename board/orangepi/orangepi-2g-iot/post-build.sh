#!/bin/sh
# post-build.sh for OrangePi taken from CubieBoard's post-build.sh
# 2013, Carlo Caione <carlo.caione@gmail.com>

BOARD_DIR="$(dirname $0)"
MKIMAGE=$HOST_DIR/usr/bin/mkimage
BOOT_CMD=$BOARD_DIR/boot.cmd
BOOT_CMD_H=$BINARIES_DIR/boot.scr

# U-Boot script
$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H

mkdir ${TARGET_DIR}/etc/ppp
mkdir ${TARGET_DIR}/etc/ppp/peers

cp ${BOARD_DIR}/configs/peers/modem ${TARGET_DIR}/etc/ppp/peers/modem
cp ${BOARD_DIR}/configs/peers/gprs ${TARGET_DIR}/etc/ppp/peers/gprs

cp ${BOARD_DIR}/configs/interfaces ${TARGET_DIR}/etc/network/interfaces
cp ${BOARD_DIR}/configs/wpa_supplicant.conf ${TARGET_DIR}/etc/wpa_supplicant.conf
cp ${BOARD_DIR}/configs/S35wifi ${TARGET_DIR}/etc/init.d/S35wifi

chmod 777 ${TARGET_DIR}/etc/init.d/S35wifi

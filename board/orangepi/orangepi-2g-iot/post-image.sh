#!/bin/sh

BOARD_DIR="$(dirname $0)"
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

cp ${BOARD_DIR}/modem.bin ${BINARIES_DIR}/modem.bin
#cp ${BOARD_DIR}/config.txt ${BINARIES_DIR}/config.txt

rm -rf "${GENIMAGE_TMP}"

genimage                               \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

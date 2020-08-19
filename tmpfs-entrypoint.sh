#!/bin/bash
set -e
echo "Mounting TMPFS with size of ${MYSQLD_DATA_RAMDISK_SIZE_MB}m"
mkdir -p /mnt/ramdisk
mount -t tmpfs -o size="${MYSQLD_DATA_RAMDISK_SIZE_MB}m" tmpfs /mnt/ramdisk

./usr/local/bin/docker-entrypoint.sh "$@"

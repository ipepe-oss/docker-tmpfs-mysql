#!/bin/bash
set -e
echo "Mounting TMPFS with size of ${MYSQLD_RAM_MB_SIZE}m"
mkdir -p /mnt/ramdisk
mount -t tmpfs -o size="${MYSQLD_RAM_MB_SIZE}m" tmpfs /mnt/ramdisk

./usr/local/bin/docker-entrypoint.sh "$@"

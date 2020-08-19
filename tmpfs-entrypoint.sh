#!/bin/bash
set -e
echo "Mounting TMPFS with size of ${MYSQLD_RAM_MB_SIZE}m"
mkdir -p /mnt/ramdisk
mount -t tmpfs -o size="${MYSQLD_RAM_MB_SIZE}m" tmpfs /var/lib/mysql/

./usr/local/bin/docker-entrypoint.sh "$@"

# docker-tmpfs-mysql
Mysql with ramdisk for data. Normal approach for doing this would be to pass tmpfs configuration into docker directly but on Mac or CI You may not be able to do so. This code works around that.

FROM mysql:5.7

ENV MYSQLD_RAM_MB_SIZE 512
ENV DATADIR=/mnt/ramdisk

COPY tmpfs-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/tmpfs-entrypoint.sh
RUN rm /entrypoint.sh && ln -s usr/local/bin/tmpfs-entrypoint.sh /tmpfs-entrypoint.sh
ENTRYPOINT ["tmpfs-entrypoint.sh"]
CMD ["mysqld", "--datadir=/mnt/ramdisk"]

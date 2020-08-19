# docker-tmpfs-mysql
Mysql with ramdisk for data. Normal approach for doing this would be to pass tmpfs configuration into docker directly but on Mac or CI You may not be able to do so. This code works around that.

# docker-compose
```yml
  tmpfs_mysqldb:
    image: ipepe/tmpfs-mysql:5.7
    privileged: true
    environment:
      - MYSQL_ALLOW_EMPTY_PASSWORD=true
      - MYSQLD_RAM_MB_SIZE=1000
    ports:
      - "3306:3306"
```

# Official/Normal approach
## via docker cli

```docker run --rm  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=finger  --tmpfs=/var/lib/mysql/:rw,noexec,nosuid,size=600m --tmpfs=/tmp/:rw,noexec,nosuid,size=50m mysql:5.7```
 

## via docker-compose

```
  mysql-57:
    image: mysql:5.7
    ports:
     - "3306:3306"
    volumes:
     - "/opt/docker/mysql.conf.d:/etc/mysql/conf.d"
    environment:
     - MYSQL_ROOT_PASSWORD=finger
    tmpfs:
     - /var/lib/mysql/:rw,noexec,nosuid,size=600m
     - /tmp/:rw,noexec,nosuid,size=50m
```


/opt/docker/mysql.conf.d/custom.cnf
```
[mysqld]
  bind-address             = 0.0.0.0
  
  innodb_flush_log_at_trx_commit = 2
  innodb_lock_wait_timeout = 50

  max_connect_errors       = 1000000
  max_connections          = 900

  character-set-server           = utf8
  sql_mode                       = ""
  innodb                         = FORCE
  default-storage-engine         = InnoDB
  max_allowed_packet             = 256M
```


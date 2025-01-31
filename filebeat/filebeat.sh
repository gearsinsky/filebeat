#!/bin/bash

# 設定變數
CONFIG_DIR="/home/bitnami/monitoring/filebeat"   # 放置 filebeat.yml 的目錄
CONTAINER_NAME="filebeat"

APACHE_LOG_DIR="/opt/bitnami/apache/logs"
PHP_FPM_LOG_DIR="/opt/bitnami/php/logs"
MYSQL_LOG_DIR="/opt/bitnami/mariadb/logs"
BITNAMI_LOG_DIR="/opt/bitnami/var/log"


# 啟動 Filebeat Docker
docker run -d --name $CONTAINER_NAME \
  --restart unless-stopped \
  -v $CONFIG_DIR/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro \
  -v $APACHE_LOG_DIR:/var/log/apache2:ro \
  -v $PHP_FPM_LOG_DIR:/var/log/php-fpm:ro \
  -v $MYSQL_LOG_DIR:/var/log/mariadb:ro \
  -v $BITNAMI_LOG_DIR:/var/log/bitnami:ro \
  --user root:root \
  elastic/filebeat:7.14.0 \
  -e -strict.perms=false


#!/bin/bash

# 設定變數
CONFIG_DIR="/home/bitnami/monitoring/filebeat"   # 放置 filebeat.yml 的目錄
CONTAINER_NAME="filebeat"

APACHE_LOG_DIR="/opt/bitnami/apache/logs"


# 啟動 Filebeat Docker
docker run -d --name $CONTAINER_NAME \
  --restart unless-stopped \
  -v $CONFIG_DIR/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro \
  -v $APACHE_LOG_DIR:/var/log/apache2:ro \
  --user root:root \
  elastic/filebeat:7.14.0 \
  -e -strict.perms=false


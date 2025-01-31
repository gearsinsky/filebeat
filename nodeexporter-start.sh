#!/bin/bash
#
#
docker run -d \
  --name node-exporter \
  -p 9100:9100 \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  --path.procfs /host/proc \
  --path.sysfs /host/sys 
  --restart unless-stopped \
  --network monitoring \
  prom/node-exporter:latest

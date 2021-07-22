#!/bin/sh -eu
(
  cd ~/isucon9-qualify

  sudo truncate --size 0 /var/log/nginx/access.log
  sudo truncate --size 0 /var/log/mysql/mysql-slow.log
  sudo systemclt restart isucari.golang.service && echo "restart isucari.golang.service"
  sudo systemctl stop payment.service shipment.service && echo "stop payment.service shipment.service"
  ./bin/benchmarker -target-url http://127.0.0.1
)

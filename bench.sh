#!/bin/sh -eu
(
  cd ~/isucon9-qualify

  sudo truncate --size 0 /var/log/nginx/access.log && echo "clear access.log"
  sudo truncate --size 0 /var/log/mysql/mysql-slow.log && echo "clear mysql-slow.log"
  sudo systemctl restart isucari.golang.service && echo "restart isucari.golang.service"
  sudo systemctl stop payment.service shipment.service && echo "stop payment.service shipment.service"
  ./bin/benchmarker -target-url http://127.0.0.1
)

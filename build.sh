#!/bin/bash -eu

(
  cd ~/isucon9-qualify/webapp/go
  git pull origin master
  rm -vf ./isucari
  make
  sudo systemctl restart isucari.golang.service && echo "restart isucari.golang.service"
)

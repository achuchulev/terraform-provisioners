#!/usr/bin/env bash

# check if redis is installed
# install redis if it's not

# check if curl is installed
which redis || {
sudo apt-get update
sudo apt-get install -y redis
}

# verify that redis server is working
redis-cli
ping
exit

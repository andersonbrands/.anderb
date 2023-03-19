#!/usr/bin/env bash

curl -LO https://download.jetbrains.com/python/pycharm-community-2022.3.tar.gz

sudo tar xzf pycharm-community-*.tar.gz -C /opt/

# run with: /opt/pycharm-community-*/bin/pycharm.sh

rm pycharm-community-*.tar.gz

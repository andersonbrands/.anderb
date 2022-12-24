#!/usr/bin/env bash


# install node
if ! hash node &> /dev/null; then
    # https://github.com/nodesource/distributions/blob/master/README.md#debinstall
    curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs
fi

#!/usr/bin/env bash


sudo apt update
sudo apt-get update


# install curl
if ! hash curl &> /dev/null; then
    sudo apt install -y curl
fi

# install git
if ! hash git &> /dev/null; then
    sudo apt install -y git
fi

WORK_DIR=$(mktemp -d)

cd $WORK_DIR

git clone https://github.com/andersonbrands/.anderb.git $WORK_DIR

source $WORK_DIR/apps/*.sh

cd -

rm $WORK_DIR -rf

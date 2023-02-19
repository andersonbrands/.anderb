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


WORK_DIR=~/dot/anderb

mkdir -p $WORK_DIR

cd $WORK_DIR

git clone https://github.com/andersonbrands/.anderb.git $WORK_DIR

chmod +x $WORK_DIR/apps/*.sh

for f in $WORK_DIR/apps/*.sh; do
    source $f
done

cd -

rm $WORK_DIR -rf

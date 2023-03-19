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


if [[ -d $WORK_DIR ]]; then
    if [[ -d $WORK_DIR/.git ]]; then
        echo repo already on $(git -C $WORK_DIR rev-parse --abbrev-ref HEAD)
    else
        echo $WORK_DIR exists but is not a git repo
        return &>/dev/null || exit
    fi
else
    git clone https://github.com/andersonbrands/.anderb.git $WORK_DIR
fi

for f in $WORK_DIR/apps/*.sh; do
    source $f
done

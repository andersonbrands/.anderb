#!/usr/bin/env bash


VALID_DISTROS="|debian|ubuntu|"


if [[ ! $DISTRO_NAME ]]; then
    if hash lsb_release &> /dev/null; then
        lsb_release --id | grep Ubuntu > /dev/null && DISTRO_NAME="ubuntu"
        lsb_release --id | grep Debian > /dev/null && DISTRO_NAME="debian"
    else
        cat /etc/*-release | grep ^NAME= | grep Ubuntu > /dev/null && DISTRO_NAME="ubuntu"
        cat /etc/*-release | grep ^NAME= | grep Debian > /dev/null && DISTRO_NAME="debian"
    fi
fi


if ! echo $VALID_DISTROS | grep "|$DISTRO_NAME|" > /dev/null; then
    echo DISTRO_NAME \"$DISTRO_NAME\" not in \"$VALID_DISTROS\"
    return &>/dev/null || exit
fi


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

source ~/.bashrc

pyenv install 3.10
pyenv global 3.10

source $WORK_DIR/res/pipx.sh
source $WORK_DIR/res/pipx_stuff.sh

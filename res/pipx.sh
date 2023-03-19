#!/usr/bin/env bash

VENVS=$HOME/dot/venvs

mkdir -p $VENVS $HOME/dot/pipx $HOME/dot/pipx_bin

echo 'export PIPX_HOME="$HOME/dot/pipx"' >> $HOME/.bashrc
echo 'export PIPX_BIN_DIR="$HOME/dot/pipx_bin"' >> $HOME/.bashrc

. $HOME/.bashrc

python -m venv $VENVS/.pipx --clear

source $VENVS/.pipx/bin/activate

pip install pipx
pipx ensurepath

pipx install pipx

deactivate

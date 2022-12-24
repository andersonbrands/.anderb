#!/usr/bin/env bash

if [ -d "${HOME}/.pyenv" ]; then
    echo "pyenv default folder exists, please remove it"
    return &>/dev/null || exit
fi

# install pyenv
if ! hash pyenv &> /dev/null; then
    sudo apt update

    # https://github.com/pyenv/pyenv/wiki#suggested-build-environment
    sudo apt install -y build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev curl llvm \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    
    curl https://pyenv.run | bash
    echo '' >> ~/.bashrc
    echo '# pyenv' >> ~/.bashrc
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
fi

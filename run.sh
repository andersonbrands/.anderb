#!/usr/bin/env bash

# install curl
if ! hash curl &> /dev/null; then
    echo "curl not found"
    sudo apt install curl
fi

# install git
if ! hash git &> /dev/null; then
    echo "git not found"
    sudo apt install git
fi

echo "TODO: clone repo"
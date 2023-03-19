#!/usr/bin/env bash

# install docker
if ! hash docker &> /dev/null; then
    ME=`whoami`

    sudo apt-get update
    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    # GPG error when running apt-get update
    # sudo chmod a+r /etc/apt/keyrings/docker.gpg
    # sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

    # post install
    sudo groupadd docker
    sudo usermod -aG docker $ME
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
    # sudo systemctl disable docker.service
    # sudo systemctl disable containerd.service

    # /etc/docker/daemon.json
    # {
    #    "log-driver": "json-file",
    #    "log-opts": {
    #      "max-size": "20m",
    #      "max-file": "5" 
    #   }
    # }
    cat $WORK_DIR/res/daemon.json > /etc/docker/daemon.json
fi

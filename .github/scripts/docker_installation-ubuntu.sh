#!/bin/bash
if ! command -v docker &> /dev/null
then
    sudo apt update -y
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    apt-cache policy docker-ce
    sudo apt install -y docker-ce
    sudo systemctl status docker

    if ! command -v docker &> /dev/null
    then
        echo "~~~~something went wrong, Docker installation failed~~~~"
    else
        echo "~~~~Docker installation was successful~~~~"
    fi
else
    echo "~~~~docker has been already installed~~~~"
fi

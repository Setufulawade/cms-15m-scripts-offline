#version 1.0 date-21-6-2024, Setu Fulwade/JPK $

##This script will donwload docker and load the docker image for apt package manager.

#!/bin/bash

echo "installing docker"

#fucnction to download docker
download() {
#Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    #Install Docker Engine, containerd, and Docker Compose:
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}
 
 #call the download function and store the return value in download_state variable.
download
download_status=$?

if [ $download_status -eq 0 ]; 
then
    echo "download successful"
    #redirect to docker_status.sh
    ./runfirefoxdocker.sh
else
    echo "download failed"
    exit 1
fi
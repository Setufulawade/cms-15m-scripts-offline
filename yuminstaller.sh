#version 1.0 date-21-6-2024, Setu Fulwade/JPK $

#This script will donwload docker and load the docker image for yum package manager.

#!/bin/bash


echo "docker is not installed installing docker"    

#fucnction to download docker
download() {
    #Update the yum packages
    sudo yum update

    
    #Set up the repository for docker
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo


    #Install Docker Engine, containerd, and Docker Compose:
    sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin    
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

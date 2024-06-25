#version 1.1 date-25-6-2024

#This script will check if the docker daemon is running. If it is docker daemon is running it will redirect to cmsfirefox.sh
#if the docker daemon is not running it will redirect to packageschecker.sh

#!bin/bash

# Function to check if Docker is running
check_docker_running() {
    sudo systemctl is-active --quiet docker
}

# Function to start Docker
start_docker() {
    sudo systemctl start docker
}

#This function Wheather docker is running or not. if not it attempts to start the docker daemon.
#This function returns true(0) if docker is  running and false(1) if it fails.
print_docker_status() {
    if check_docker_running; 
    then
        echo "Docker is already running."   
        return 0
    else
        echo "Docker is not running. Starting Docker..."
        start_docker

        if check_docker_running; 
        then
            echo "Docker started successfully."
            return 0
        else
            echo "Failed to start Docker."
            return 1
        fi
    fi
}

#Prints_docker_status fuction is called:
print_docker_status
#print_docker_status is return value is captured in the variable docker_running_status
docker_running_status=$?


#if docker is running load the docker image from local image tar file.
load_image() {
  # Check if the Docker image exists
  if ! sudo docker images | grep -q 'cms15m.*v1_0'; then
    echo "Image cms15m:v1_0 not found. Loading image..."
    
    # Load the image from the tar file
    sudo docker load -i cms15m-v1_0.tar
    
    if [ $? -eq 0 ]; then
      echo "Image cms15m:v1_0 loaded successfully."
    else
      echo "Failed to load the image cms15m:v1_0."
    fi
  else
    echo "Image cms15m:v1_0 already exists."
  fi
}


#opens cmsfirefox if docker is running else opens packagechecker if docker is not running.
if [ $docker_running_status -eq 0 ]; 
then
    load_image
    chmod +x cmsfirefox.sh
    ./cmsfirefox.sh
else
    chmod +x packageschecker.sh
    ./packageschecker.sh
fi




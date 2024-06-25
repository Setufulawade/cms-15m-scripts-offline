#version 1.1 date-25-6-2024

#This script is used to run the firefox browser from the docker image.

#!bin/bash

#Allow Docker Containers to Access X Server:
xhost +local:docker

#terminate pervoious containers.
sudo docker rm $(sudo docker ps -a --filter "ancestor=cms15m:v1_0" --format "{{.ID}}")

#Runs the docker container in display enivronment
sudo docker run -it     --env="DISPLAY"     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"     cms15m:v1_0 firefox
# How to use
------------------------------------------------------------------------------------------------------------------------------

Open the terminal in linux-script folder and run the following command 
>chmod +x runfirefoxdocker.sh

after executing the above command execute the script using the following command inside the terminal-
>./runfirefoxdocker.sh

--------------------------------------------------------------------------------------------------------------------------------

# Logic
--------------------------------------------------------------------------------------------------------------------------------
for logic of the script refer Script_logic_diagram.pdf inside the folder

Description of the script-

1.runfirefoxdocker.sh - Check the whether docker is running or not. if docker is not running redirects to packagechecker.sh else loads the cms15m:v1 image and redirects to cmsfirefox.sh

2.cmsfirefox.sh - terminate the container and starts a new container with firefox

3.packagechecker.sh - its checks which package manager the linux machine is running, apt or yum and redirects to aptinstaller.sh or yuminstaller.sh accordingly.

4.aptinstaller.sh - installs docker and installs the docker image present inside the folder then redirects to docker_status.sh

5.yuminstaller.sh - installs docker and installs the docker image present inside the folder then redirects to docker_status.sh
-----------------------------------------------------------------------------------------------------------------------------------
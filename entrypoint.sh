#!/bin/bash
cd /home/container

# Output Current Java Version
java -version

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

clear

FILE=server.jar
if test -f "$FILE"; then
    java -Xmx1024M -Xms1024M -jar server.jar nogui
fi

echo -e "\e[1;31mProject \e[1;35mAstro"
echo "* Welcome to ProjectAstro MC Egg Install"
echo "* Developed by Rhys."
echo "* Pick an option!."
echo "1. Install Paper"
echo "2  Install Forge"
read -p "Please enter a number: " choice

if [ $choice == "1" ]
    then
    echo "Installing Latest Verion of Paper"
    bash <(curl https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/379/downloads/paper-1.18.2-379.jar --output paper-1.18.2-379.jar)
    echo "Installed"
    echo "Starting"
    mv paper-1.18.2-379.jar server.jar
    java -Xmx1024M -Xms1024M -jar server.jar nogui
fi

if [ $choice == "2" ]
    then
    echo "Installing Latest Verion of Forge"
    bash <(curl -sSL https://google.com/)
fi

# Run the Server
eval ${MODIFIED_STARTUP}

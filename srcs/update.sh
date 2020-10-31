#!/bin/sh

#Setup to be done, Before runing setup.sh with VM Virtua-box
#
# Firsto of all, Set Docker to run Without Sudo.
# - sudo groupadd docker
# - sudo gpasswd -a $USER docker
# - sudo service docker restart or sudo service docker.io restart
# - Also, restart the VM t set PATH correctly.

# After that, make sure that your VM has the following configurations:
# - 2 or More CPUS core;
# - System Acceleration VT-x/AMD-V enabled;
# - Nested virtualization enabled - Optional;
# - Internet Connection;
# - Minikube version: 1.14.2;
# - Optional: Filezilla to test FTP.

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm -f ./minikube-linux-amd64
sudo apt-get install filezilla
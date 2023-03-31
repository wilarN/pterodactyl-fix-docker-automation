#!/bin/bash

# Purge old docker, other files.
echo "[[[purging docker, docker-engine, docker.io, docker-ce, docker-ce-cli]]]"
sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce

# Curl, install.
echo "[[[Curl-pulling & installing docker.]]]"
curl -sSL https://get.docker.com/ | CHANNEL=stable bash


# Enabling docker.
echo "[[[Enabling docker.]]]"
sudo systemctl enable --now docker

##### Debug Wings ######
# echo "[[[debugging wings connection.]]]"
# sudo wings --debug
########################

# Enable wings.
echo  "[[[Enabling wings.]]]"
sudo systemctl enable --now wings


# Restart wings in case of some stupid shit not working(Usually what's needed).
echo "[[[Restarting Wings.]]]"
sudo systemctl restart wings

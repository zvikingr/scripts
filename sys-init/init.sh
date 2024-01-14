#!/bin/bash

apt update && apt upgrade

# dev required
apt install -y tree git vim net-tools htop tmux golang bridge-utils zsh jq make iftop sysstat ethtool iproute2

apt install -y hugo

# docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh


#!/bin/bash

echo -e "\nInstalling curl"
sudo apt install -y curl

echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo apt-get update -y &&\
    sudo apt-get install google-cloud-sdk kubectl

gcloud init

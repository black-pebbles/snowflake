#!/bin/bash


ver='1.0.8'
terraform_version='terraform_${ver}_linux_amd64.zip'

wget https://releases.hashicorp.com/terraform/${ver}/terraform_${ver}_linux_amd64.zip
unzip terraform_${ver}_linux_amd64.zip
sudo mv terraform /opt/terraform
sudo ln -sf /opt/terraform /usr/local/bin/terraform

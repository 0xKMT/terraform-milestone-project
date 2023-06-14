#!/bin/bash
# Set your AWS access credentials
# export AWS_ACCESS_KEY_ID=""
# export AWS_SECRET_ACCESS_KEY=""

echo "--- Provisioning Docker CE AMI ---"
# Define the path to your Packer template file
PACKER_TEMPLATE="./ubuntu_docker_ce_ami.json"

# Validate the Packer template
packer validate $PACKER_TEMPLATE

# Build the AMI using Packer
packer build -color=false $PACKER_TEMPLATE
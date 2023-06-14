#!/bin/bash

set -e

echo "--- Provisioning Docker CE AMI ---"

# Build the AMI using Packer
packer build ubuntu_docker_ce_ami.json 
             
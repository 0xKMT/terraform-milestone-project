#!/bin/bash

# Install Docker if not already installed
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    sudo systemctl start docker
    echo "Docker installation completed."
else
    echo "Docker is already installed."
fi

docker --version

# Pull the Apache Superset Docker image
echo "Pulling Apache Superset Docker image..."
sudo docker pull apache/superset

#set up for apache superset
sudo docker run --restart=always -d -p 8080:8088 -e "SUPERSET_SECRET_KEY=qwerty123" --name superset apache/superset

sudo docker exec superset superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin

docker exec superset superset db upgrade

docker exec superset superset load_examples

docker exec superset superset init

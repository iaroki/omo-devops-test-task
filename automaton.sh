#!/bin/bash

set -ex

PARENT_DIR=$(basename "${PWD%/*}")
CURRENT_DIR="${PWD##*/}"
IMAGE_NAME="dsbios/$CURRENT_DIR" 
# also you can change your ${PARENT_DIR} env to your dockerhub username if you need. Be like *IMAGE_NAME="dsbios/$CURRENT_DIR"*                     

REGISTRY="docker.io"
docker login -u=$DOCKERHUB_USER -p=$DOCKERHUB_PASSWORD
docker build -t ${IMAGE_NAME}:$TAG -t ${IMAGE_NAME}:latest .
docker push ${IMAGE_NAME}

ansible-playbook main.yml
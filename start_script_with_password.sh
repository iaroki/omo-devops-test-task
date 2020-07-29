#!/bin/bash
DOCKER_PASS=INPUT_PASSWORD
docker login --username=sergeyzaika --password=$DOCKER_PASS
docker build -t app.py:v1 .
imageID=$(sudo docker images -q app.py:v1)
docker tag $imageID sergeyzaika/app.py:v1
docker push sergeyzaika/app.py:v1
ansible-playbook deploy_run_app.py.yml

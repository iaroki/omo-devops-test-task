#!/bin/bash
docker build -t app.py:v1 .
#DOCKER_PASS=INPUT_PASSWORD
#docker login --username=sergeyzaika --password=$DOCKER_PASS
#imageID=$(sudo docker images -q app.py:v1)
#docker tag $imageID sergeyzaika/app.py:v1
#sudo docker push sergeyzaika/app.py:v1
ansible-playbook deploy_run_without_pull.yml

#!/bin/bash

echo "------Install Ansible------"
package=ansible
        sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
        sudo yum install --enablerepo epel-playground ansible
	echo "$package is installed."


echo $'\n'

echo "------Install Docker------"
package=docker
        curl -fsSL https://get.docker.com -o install_docker.sh
        sudo sh install_docker.sh
        sudo usermod -aG docker root

echo $'\n'

echo "--------Create Docker build---------"
        
        set -x
        image_ID=$(docker build -q -t ydat/my-app .)
        sleep 10
        echo "$image_ID"
        echo $'\n'
        docker tag $image_ID ydat/my-app
        docker ps -a
        echo $'\n'
        sleep 10
        echo "$DOCKER_HUB_PWD" | docker login --username="$DOCKER_HUB_UNAME" 
        echo $'\n'
        docker push ydat/my-app
echo $'\n'

echo "------Run Ansible playbook------"

	ansible-playbook deploy_docker.yml
	
echo $'\n'
	
echo "------App started on localhost:4996------"












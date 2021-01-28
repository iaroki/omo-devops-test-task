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
        build_image=$(docker build -d -t ydat/my-app:0.1 .)
        echo "$build_image"
        echo $'\n'
        docker ps -a
        echo "$DOCKER_HUB_PWD" | docker login --username="$DOCKER_HUB_UNAME" 
        echo $'\n'
        docker push ydat/my-app:0.1
echo $'\n'

echo "------Run Ansible playbook------"

	ansible-playbook deploy_docker.yml
	
echo $'\n'
	
echo "------App started on localhost:4996------"












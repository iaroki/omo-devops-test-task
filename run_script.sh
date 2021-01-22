#!/bin/bash

echo "----------Install Python-----------------"
package=python3
	apt-get update
	apt-get upgrade -y
	apt-get install $package -y;
	echo "$package is installed."
	
echo $'\n'

echo "------Install Ansible------"
package=ansible
	apt-add-repository ppa:ansible/ansible
	apt-get update -y
	apt-get upgrade -y
	apt-get install $package -y;
	echo "$package is installed."


echo $'\n'

echo "------Install Docker------"
package=docker
	apt-get update -y
	apt-get upgrade -y
    
	#Docker dependencies
	
	apt-get install \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	
	#Docker GPG key
	
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	
	apt-get update -y
	apt-get install $package -y
	systemctl start $package -y
	systemctl enable $package -y;
	echo "$package is installed."


echo $'\n'

echo "------Build Docker image------"
	
	#Create Docker image from Dockerfile
	docker build -t local/app.py:prod .
	
echo $'\n'

echo "------Run Ansible playbook------"

	ansible-playbook deploy_docker.yml
	
echo $'\n'
	
echo "------App started on localhost:4996------"












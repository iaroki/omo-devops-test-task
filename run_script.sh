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

echo "------Run Ansible playbook------"

	ansible-playbook deploy_docker.yml
	
echo $'\n'
	
echo "------App started on localhost:4996------"












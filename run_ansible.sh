#!/usr/bin/env bash

#file hosts.txt - add ip host + add user
#where we deploy our application.
ansible-playbook -i hosts.txt playbook.yml -vvv

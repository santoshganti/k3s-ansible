#!/bin/bash

ansible-playbook ./update.yml -i ./inventory/proxmox/hosts.ini

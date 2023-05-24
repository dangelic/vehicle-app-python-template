#!/bin/sh

IP="$1"

# Backup of current config json 
ssh root@$IP 'mv config.json /etc/container-management/config.json.back'

# Copy new config json 
scp config.json root@$IP:/etc/container-management/config.json

# Restart container service 
ssh root@$IP 'systemctl restart container-management.service'

# Copy app json to kanto manifest folder
scp app.json root@$IP:/data/var/containers/manifests/app.json

# Restart Auto deployer service
ssh root@$IP 'systemctl restart kanto-auto-deployer'

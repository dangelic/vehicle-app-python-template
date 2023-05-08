#!/bin/sh

# Downlaod latest release
wget https://github.com/software-engineering-project-org/vehicle-app-python-template/releases/latest/download/sampleapp.tar

# Import app to containerd
ctr image import sampleapp.tar

file="$(ctr image ls | grep docker.io | cut -d' ' -f1)"

# Run the application
ctr run $file sampleapp
#!/bin/bash

aws ec2 run-instances \
--image-id ami-0f559c3642608c138 \
--count 3 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://nginx-install.sh
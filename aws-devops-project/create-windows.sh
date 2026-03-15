#!/bin/bash

aws ec2 run-instances \
--image-id ami-05773800d221ec923 \
--count 2 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg
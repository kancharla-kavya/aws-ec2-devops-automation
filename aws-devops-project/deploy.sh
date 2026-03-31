#!/bin/bash

set -e
echo "===================================="
echo "Starting AWS EC2 Automation Deploy"
echo "===================================="

echo "Launching Linux Instance 1"

LINUX1_ID=$(aws ec2 run-instances \
--image-id ami-0f559c3642608c138 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://aws-devops-project/linux/linux1.sh \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Linux-Nginx}]' \
--query "Instances[0].InstanceId" \
--output text)

echo "Linux Instance 1 launched -> $LINUX1_ID"

echo "Launching Linux Instance 2"
LINUX2_ID=$(aws ec2 run-instances \
--image-id ami-0f559c3642608c138 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://aws-devops-project/linux/linux2.sh \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Linux-Docker}]' \
--query "Instances[0].InstanceId" \
--output text)

echo "Linux Instance 2 launched -> $LINUX2_ID"

echo "Launching Linux Instance 3"
LINUX3_ID=$(aws ec2 run-instances \
--image-id ami-0f559c3642608c138 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://aws-devops-project/linux/linux3.sh \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Linux-Python}]' \
--query "Instances[0].InstanceId" \
--output text)
echo "Linux Instance 3 launched -> $LINUX3_ID"

echo "Launching Windows Instance 1"

WIN1_ID=$(aws ec2 run-instances \
--image-id ami-05773800d221ec923 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://aws-devops-project/windows/windows1.ps1 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Windows-Webpage}]' \
--query "Instances[0].InstanceId" \
--output text)
echo "Windows Instance 1 launched -> $WIN1_ID"

echo "Launching Windows Instance 2"

WIN2_ID=$(aws ec2 run-instances \
--image-id ami-05773800d221ec923 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://aws-devops-project/windows/windows2.ps1 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Windows-Chrome}]' \
--query "Instances[0].InstanceId" \
--output text)
echo "Windows Instance 2 launched -> $WIN2_ID"

echo "===================================="

echo "All 5 instances launched successfully"

echo "===================================="
echo "Checking launched instances..."
aws ec2 describe-instances \
--filters "Name=instance-state-name,Values=pending,running" \
--query "Reservations[*].Instances[*].[InstanceId,State.Name]" \
--output table

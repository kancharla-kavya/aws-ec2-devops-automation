deploy.sh
#!/bin/bash

 

echo "===================================="
echo "Starting AWS EC2 Automation Deploy"
echo "===================================="

 

echo "Launching Linux Instance 1"
aws ec2 run-instances \
--image-id ami-0f559c3642608c138 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://linux/linux1.sh \
--tag-specifications 'ResourceType=instance, Tags=[{Key=Name, Value=Linux-Nginx}]'

 

echo "Launching Linux Instance 2"
aws ec2 run-instances \
--image-id ami-0f559c3642608c138 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://linux/linux2.sh \
--tag-specifications 'ResourceType=instance, Tags=[{Key=Name, Value=Linux-docker}]'

 

echo "Launching Linux Instance 3"
aws ec2 run-instances \
--image-id ami-0f559c3642608c138 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://linux/linux3.sh \
--tag-specifications 'ResourceType=instance, Tags=[{Key=Name, Value=Linux-Python}]'

 

echo "Launching Windows Instance 1"
aws ec2 run-instances \
--image-id ami-05773800d221ec923 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://windows/windows1.ps1 \
--tag-specifications 'ResourceType=instance, Tags=[{Key=Name, Value=Windows-webpage}]'

 

echo "Launching Windows Instance 2"
aws ec2 run-instances \
--image-id ami-05773800d221ec923 \
--count 1 \
--instance-type t3.micro \
--key-name devops-key \
--security-groups devops-sg \
--user-data file://windows/windows2.ps1 \
--tag-specifications 'ResourceType=instance, Tags=[{Key=Name, Value=Windows-chrome}]'
echo "===================================="
echo "All 5 instances launched successfully"
echo "===================================="

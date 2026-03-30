
#!/bin/bash

set -e

 

echo "===================================="

echo "Starting AWS EC2 Automation Deploy"

echo "===================================="

 

# Common variables

LINUX_AMI="ami-0f559c3642608c138"

WINDOWS_AMI="ami-05773800d221ec923"

INSTANCE_TYPE="t3.micro"

KEY_NAME="devops-key"

SECURITY_GROUP="devops-sg"

 

launch_instance() {

    NAME=$1

    AMI=$2

    USERDATA=$3

 

    echo "Launching $NAME..."

 

    INSTANCE_ID=$(aws ec2 run-instances \

        --image-id $AMI \

        --count 1 \

        --instance-type $INSTANCE_TYPE \

        --key-name $KEY_NAME \

        --security-groups $SECURITY_GROUP \

        --user-data file://$USERDATA \

        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$NAME}]" \

        --query "Instances[0].InstanceId" \

        --output text)

 

    echo "$NAME launched successfully → $INSTANCE_ID"

}

 

# Linux instances

launch_instance "Linux-Nginx" $LINUX_AMI linux/linux1.sh

launch_instance "Linux-Docker" $LINUX_AMI linux/linux2.sh

launch_instance "Linux-Python" $LINUX_AMI linux/linux3.sh

 

# Windows instances

launch_instance "Windows-Webpage" $WINDOWS_AMI windows/windows1.ps1

launch_instance "Windows-Chrome" $WINDOWS_AMI windows/windows2.ps1

 

echo "===================================="

echo "All 5 instances launched successfully"

echo "===================================="



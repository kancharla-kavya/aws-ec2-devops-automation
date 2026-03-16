#!/bin/bash
set -e

# Update packages
yum update -y

# Install python and nginx
yum install -y python3
amazon-linux-extras install nginx1 -y

# Start nginx
systemctl start nginx
systemctl enable nginx

# Create python script
echo "print('Python installed successfully on this EC2 instance')" > /home/ec2-user/test.py

# Run python and display output on webpage
python3 /home/ec2-user/test.py > /usr/share/nginx/html/index.html
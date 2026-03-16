#!/bin/bash

dnf update -y
dnf install nginx python3 -y

systemctl start nginx
systemctl enable nginx

echo "print('Python installed successfully on this EC2 instance')" > /home/ec2-user/test.py

python3 /home/ec2-user/test.py > /usr/share/nginx/html/index.html

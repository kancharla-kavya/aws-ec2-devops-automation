#!/bin/bash

 

# Log everything (for debugging if needed)

exec > /var/log/user-data.log 2>&1

 

# Wait until network + repos ready

sleep 40

 

# Install nginx + python

dnf update -y

dnf install -y nginx python3

 

# Remove default nginx page

rm -f /usr/share/nginx/html/index.html

 

# Create your custom page using Python

echo "print('Python Installed Successfully on EC2 ')" > /home/ec2-user/app.py

python3 /home/ec2-user/app.py > /usr/share/nginx/html/index.html

 

# Start nginx AFTER content is ready

systemctl enable nginx

systemctl restart nginx

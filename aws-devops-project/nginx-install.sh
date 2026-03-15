#!/bin/bash
set -e

# Update system packages
yum update -y

# Install NGINX
amazon-linux-extras install nginx1 -y

# Start NGINX
systemctl start nginx

# Enable NGINX on boot
systemctl enable nginx

# Deploy simple webpage
echo "<h1 style='text-align:center'>DevOps Automation Project - Kavya</h1>" > /usr/share/nginx/html/index.html
#!/bin/bash
set -e

# Update packages
yum update -y

# Install nginx and curl
amazon-linux-extras install nginx1 -y
yum install -y curl

# Start nginx
systemctl start nginx
systemctl enable nginx

# Create folder for image
mkdir -p /usr/share/nginx/html/images

# Download an image
curl -o /usr/share/nginx/html/images/aws.png https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg

# Create webpage displaying image
echo "<html>
<head>
<title>Linux Instance 2</title>
</head>
<body style='text-align:center;font-family:Arial'>
<h1>Linux Instance 2</h1>
<p>This server displays an image hosted on EC2</p>
<img src='images/aws.png' width='300'>
</body>
</html>" > /usr/share/nginx/html/index.html
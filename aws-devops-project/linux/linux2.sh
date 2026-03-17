#!/bin/bash

# Detect package manager
if command -v dnf &> /dev/null
then
    dnf update -y
    dnf install -y nginx curl
else
    yum update -y
    yum install -y nginx curl
fi

systemctl start nginx
systemctl enable nginx

sleep 10

mkdir -p /usr/share/nginx/html/images

curl -o /usr/share/nginx/html/images/aws.png https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg

echo "<html>
<body style='text-align:center'>
<h1>Linux Instance 2</h1>
<p>This server displays an image hosted on EC2</p>
<img src='https://securitydive.in/wp-content/uploads/2024/12/mmmmmmm.jpg' width='300'>
</body>
</html>" > /usr/share/nginx/html/index.html

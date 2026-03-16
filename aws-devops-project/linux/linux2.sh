#!/bin/bash

dnf update -y
dnf install nginx curl -y

systemctl start nginx
systemctl enable nginx

mkdir -p /usr/share/nginx/html/images

curl -o /usr/share/nginx/html/images/aws.png https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg

echo "<html>
<body style='text-align:center'>
<h1>Linux Instance 2</h1>
<p>This server displays an image hosted on EC2</p>
<img src='images/aws.png' width='300'>
</body>
</html>" > /usr/share/nginx/html/index.html

#!/bin/bash

sleep 30

dnf update -y
dnf install nginx python3 

systemctl start nginx
systemctl enable nginx

echo "<h1 style='text-align:center'> Python Installed Successfully on this EC2 instance </h1>" > /usr/share/nginx/html/index.html 

systemctl restart nginx

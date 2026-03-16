#!/bin/bash

dnf update -y
dnf install nginx -y

systemctl start nginx
systemctl enable nginx

echo "<h1 style='text-align:center'>Linux Instance 1 - Text Page</h1>" > /usr/share/nginx/html/index.html

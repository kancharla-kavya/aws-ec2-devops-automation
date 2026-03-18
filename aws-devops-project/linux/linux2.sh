#!/bin/bash
 
# Update system
dnf update -y
 
# Install Docker
dnf install -y docker
 
# Start Docker
systemctl start docker
systemctl enable docker
 
# Give ec2-user permission to run docker
usermod -aG docker ec2-user
 
# Pull and run Nginx container
docker run -d -p 80:80 --name mynginx nginx
 
# Replace default HTML inside container
docker exec mynginx bash -c 'echo "
<!DOCTYPE html>
<html>
<head>
<title>Linux Docker Server</title>
</head>
<body style=\"text-align:center;font-family:Arial;\">
<h1>🚀 Hello from Linux EC2 + Docker!</h1>
<p>This page is running inside a Docker container.</p>
<p>Fully automated using linux2.sh 🎯</p>
</body>
</html>
" > /usr/share/nginx/html/index.html'
 

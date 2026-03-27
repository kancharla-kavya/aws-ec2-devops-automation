#!/bin/bash
 
# Update system
dnf update -y
 
# Install Docker
dnf install -y docker
 
# Start and enable Docker
systemctl start docker
systemctl enable docker
 
# Wait until Docker is fully ready
sleep 15
 
# Pull nginx image
docker pull nginx
 
# Run nginx container
docker run -d -p 80:80 --name mynginx nginx
 
# Wait for container to start
sleep 10
 
# Create custom HTML page
cat <<EOF > /tmp/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Linux Docker Server</title>
</head>
<body style="text-align:center; font-family:Arial;">
    <h1> Hello from Linux EC2 + Docker!</h1>
    <p>This website is deployed automatically using a script.</p>
    <p>Docker + Nginx running successfully </p>
</body>
</html>
EOF
 
# Copy HTML into container
docker cp /tmp/index.html mynginx:/usr/share/nginx/html/index.html
 
# Restart container to reflect changes
docker restart mynginx
 
# Open firewall (just in case)
systemctl restart firewalld || true
 

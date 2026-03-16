
#!/bin/bash
yum update -y
amazon-linux-extras install nginx1 -y
systemctl start nginx
systemctl enable nginx

echo "<h1 style='text-align:center'>Linux Instance 1 - Text Page</h1>" > /usr/share/nginx/html/index.html
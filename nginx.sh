#!/bin/bash

# Update packages
yum update -y

# Enable and install Nginx (only works on Amazon Linux 2)
amazon-linux-extras enable nginx1
yum install -y nginx

# Start and enable Nginx service
systemctl start nginx
systemctl enable nginx

# Create a basic HTML page
echo "<h1>This is a web Page Automated using Terraform</h1>" > /usr/share/nginx/html/index.html

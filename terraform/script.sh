#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "hello apache" >/var/www/html/index.html


#!/bin/bash
sudo -i
yum install nginx -y
systemctl start nginx.service
systemctl enable nginx.service
echo "hello apache" >/usr/share/html/index.html

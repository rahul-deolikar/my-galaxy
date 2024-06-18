//for use of httpd server installation script

user_data =<<-EOF

#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "hello apache" >/var/www/html/index.html

EOF



//for use of nginx server installation script

user_data =<<-EOF
#!/bin/bash
sudo -i
yum install nginx -y
systemctl start nginx.service
systemctl enable nginx.service
echo "hello apache" >/usr/share/html/index.html

EOF

#!bin/bash
sudo -i
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo yum install git -y
cd /home/ec2-user
git clone https://github.com/ravillaramu/deepdive.git
mv /home/ec2-user/deepdive/* /var/www/html
sudo systemctl restart httpd
rm -rf /home/ec2-user/deepdive
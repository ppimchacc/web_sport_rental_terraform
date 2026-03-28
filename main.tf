provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "web_sg" {
  name = "ppimchacc-web-sg"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0c1d28734eb221b6d"
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.web_sg.id]

user_data = <<-EOF
#!/bin/bash
apt update -y

apt install -y apache2 php libapache2-mod-php mysql-server php-mysql git unzip

systemctl start apache2
systemctl start mysql

sleep 10

echo "[mysqld]" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "sql_mode=''" >> /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql
sleep 5

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY ''; FLUSH PRIVILEGES;"

# create DB
mysql -e "CREATE DATABASE sports_rental_system;"

# deploy web
cd /var/www/html
rm -rf *

git clone https://github.com/ppimchacc/web_sport_customer.git .

ln -s /var/www/html /var/www/html/sports_rental_system

mkdir -p /var/www/html/uploads

# import DB
mysql -u root sports_rental_system < sports_rental_system.sql

# permission
chown -R www-data:www-data /var/www/html

systemctl restart apache2
EOF

  tags = {
    Name = "web-sport-system"
  }
}

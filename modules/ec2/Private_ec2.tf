resource "aws_instance" "Private_servers" {
  count                       = var.env == "Prod" ? 3 : 2
  ami                         = lookup(var.ami, var.region)
  instance_type               = var.instance_type
  key_name                    = lookup(var.key, var.region)
  subnet_id                   = element(var.Private_subnet_id, count.index)
  vpc_security_group_ids      = [var.security]
 
  tags = {
    Name        = "${var.vpc_name}-Privateserver-${count.index + 1}"
    environment = "${var.env}"
  }

  user_data = <<EOF
#!/bin/bash
apt update -y
apt install nginx -y
service nginx start
sudo apt install git -y
sudo git clone -b test https://github.com/chaitanyadurgasoft/website.git
sudo rm -rf /var/www/html/index.nginx-debian.html
sudo cp website/index.html /var/www/html/
sudo cp website/aws.png  /var/www/html/
sudo cp website/cloud.jpg /var/www/html/
sudo echo "<h1>Public-server-1</h1>" >> /var/www/html/index.html
EOF

}

resource "aws_instance" "SebasInstancia" {
  ami = "ami-053b0d53c279acc90" 

  instance_type = "t2.micro"
  key_name = aws_key_pair.LlavePuSebas.key_name
  subnet_id = aws_subnet.challengeSubnet.id
  vpc_security_group_ids = [aws_security_group.challengeSecutiry.id]

    user_data = <<EOF
#!/bin/bash
sudo sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install nginx -y
cd /var/www/
sudo chgrp ubuntu html
sudo chown ubuntu html
cd html
wget https://challengeiac.s3.amazonaws.com/binaries2.zip
sudo apt-get install unzip
unzip binaries.zip
EOF

  tags = {
    Name = "challenge_Instance"
  }
}
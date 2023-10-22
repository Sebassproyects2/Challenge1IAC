resource "aws_instance" "SebasInstancia" {
  ami = "ami-053b0d53c279acc90" 

  instance_type = "t2.micro"
  key_name = aws_key_pair.LlavePuSebas.key_name
  subnet_id = aws_subnet.challengeSubnet.id
  vpc_security_group_ids = [aws_security_group.challengeSecutiry.id]

  tags = {
    Name = "challenge_Instance"
  }
}
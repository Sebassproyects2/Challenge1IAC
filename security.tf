resource "aws_security_group" "challengeSecutiry" {
  name        = var.variSecurityC
  description = "Security group del challenge IAC"
  vpc_id      = aws_vpc.challengeVPC.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.variSecurityC
  }
}

resource "aws_key_pair" "LlavePuSebas" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5U0Bmg58pCDPJy/5Lq59XrjTm6LrVJ7Cckn6zhH8l+SvC5Eask7It7C3GHLLKgytLjgzjkjucvro2Ozm7Ruxjx3FiR0gHCHTdKlLAlBguw7bmuhL2GilM1AEmNXZZzQfcEKkPxIkpuN7GyHxIDjSVhULKkpvtxffreg8TJcrJzWKhyCWsUbr+M4CNE0p0OjESZuAtVPOSJPYIIgQnU5iWp3HTgUr8bVs23yPTS4oRtJXRPhYwOt+KQsb9T7jU8Y6UqUtxDurpYVIIZTZm8PxsStDouVycYPwQjOiNclDNr7YZpDL93RorQNtHr9nU8UYwF+ENQBoGd4rSLCdQHS6aoGjsf58v3mQOFgOBK44INlqBXrgmTjDsLaZ1BopoKrGNPOMbnnBFR/05n2Z2fOV+afd1j2vZNmPY0Z+8D4GnanUdJQyuWQyOmzDGCYIFWoNQPvJaiwZldV4unp895d8Xm206RR/IYXGrfpzsZZqFH/LV9sXHVLPYFIfSULahiRs= sebas@LAPTOP-7VUDLRD8"
}
resource "aws_vpc" "challengeVPC" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "sebas_challenge_VPC"
  }
}

resource "aws_subnet" "challengeSubnet" {
  vpc_id     = aws_vpc.challengeVPC.id
  cidr_block = var.variSubnet
  map_public_ip_on_launch = true

  tags = {
    Name = "sebas_challenge_Subnet"
  }
}

resource "aws_internet_gateway" "challengeGW" {
  vpc_id = aws_vpc.challengeVPC.id

  tags = {
    Name = "sebas_challenge_GW"
  }
}

resource "aws_route_table" "challengeRouteT" {
  vpc_id = aws_vpc.challengeVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.challengeGW.id
  }

  tags = {
    Name = "sebas_challenge_RT"
  }
}

resource "aws_route_table_association" "challengeRTAso" {
  subnet_id      = aws_subnet.challengeSubnet.id
  route_table_id = aws_route_table.challengeRouteT.id
}
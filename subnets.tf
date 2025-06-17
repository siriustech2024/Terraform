# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.eks.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-1a"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.eks.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-1b"
  }
}

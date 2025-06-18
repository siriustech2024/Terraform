resource "aws_internet_gateway" "eks-igw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project}-igw"
    }
  )
}

resource "aws_route_table" "igw-rt" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project}-igw-rt"
    }
  )
}


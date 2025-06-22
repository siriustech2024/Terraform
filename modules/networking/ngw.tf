# For 1a Availability Zone --------------------------------

resource "aws_eip" "ngw-eip-1a" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "${var.project}-eip_1a"
    }
  )
}

resource "aws_nat_gateway" "ngw-1a" {
  allocation_id = aws_eip.ngw-eip-1a.id
  subnet_id     = aws_subnet.public_1a.id
  tags = merge(
    var.tags,
    {
      Name = "${var.project}-ngw_1a"
    }
  )
}

resource "aws_route_table" "priv-rt-1a" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw-1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project}-priv-rt-1a"
    }
  )
}

resource "aws_route_table_association" "rtb_assoc_priv_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.priv-rt-1a.id
}


# For 1b Availability Zone --------------------------------

resource "aws_eip" "ngw-eip-1b" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "${var.project}-eip_1b"
    }
  )
}

resource "aws_nat_gateway" "ngw-1b" {
  allocation_id = aws_eip.ngw-eip-1b.id
  subnet_id     = aws_subnet.public_1b.id
  tags = merge(
    var.tags,
    {
      Name = "${var.project}-ngw_1b"
    }
  )
}

resource "aws_route_table" "priv-rt-1b" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw-1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project}-priv-rt-1b"
    }
  )
}

resource "aws_route_table_association" "rtb_assoc_priv_1b" {
  subnet_id      = aws_subnet.private_1b.id
  route_table_id = aws_route_table.priv-rt-1b.id
}

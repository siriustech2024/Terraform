# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

# Public Subnets -------------------------------------------------------------------

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name                     = "public-1a"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name                     = "public-1b"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_route_table_association" "rtb_assoc_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.igw-rt.id
}

resource "aws_route_table_association" "rtb_assoc_1b" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_route_table.igw-rt.id
}

# Private Subnets -------------------------------------------------------------------

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${var.region}a"

  tags = merge(
    var.tags,
    {
      Name                              = "private-1a"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "private_1b" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${var.region}b"

  tags = merge(
    var.tags,
    {
      Name                              = "private-1b"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

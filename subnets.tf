# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

# Public Subnets -------------------------------------------------------------------

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
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
    local.tags,
    {
      Name                     = "public-1b"
      "kubernetes.io/role/elb" = 1
    }
  )
}

# Private Subnets -------------------------------------------------------------------

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${var.region}a"

  tags = merge(
    local.tags,
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
    local.tags,
    {
      Name                              = "private-1b"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

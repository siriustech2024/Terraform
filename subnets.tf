# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.eks.id
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
  vpc_id                  = aws_vpc.eks.id
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

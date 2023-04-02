resource "aws_vpc" "vpc_tf" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags                 = { Name = "${var.vpc_name}" }
}


resource "aws_subnet" "sn_public" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = cidrsubnet("${var.vpc_cidr_block}", 4, 1)

}

resource "aws_subnet" "sn_private" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = cidrsubnet("${var.vpc_cidr_block}", 4, 2)

}

resource "aws_internet_gateway" "igw_a" {
  vpc_id = aws_vpc.vpc_tf.id
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_a.id
  }

}

resource "aws_route_table_association" "vpc_sn_public_rt_assoc" {
  subnet_id      = aws_subnet.sn_public.id
  route_table_id = aws_route_table.rt_public.id
}

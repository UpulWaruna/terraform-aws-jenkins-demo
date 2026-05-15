resource "aws_vpc" "vpc_dev" {

  cidr_block = var.cidr_block
  tags = {
    Name = "main"
  }
}
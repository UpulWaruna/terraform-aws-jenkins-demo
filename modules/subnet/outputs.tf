output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "subnet_cidr_block" {
  value = var.subnet_cidr_block
}
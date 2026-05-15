output "instance_ids" {
  value = aws_instance.ec2_instance[*].id
}

output "public_ips" {
  value = aws_instance.ec2_instance[*].public_ip
}

output "private_ips" {
  value = aws_instance.ec2_instance[*].private_ip
}

/*
output "availability_zones" {
  value = var.azs
}

output "deployed_availability_zones" {
  value = aws_instance.ec2_instance[*].availability_zone
} */


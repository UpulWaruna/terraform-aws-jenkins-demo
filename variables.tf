variable "env" {
  type = string
}


variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_tag_name_prefix" {
  type    = string
  default = "ec2-module"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  type    = string
  default = "10.0.2.0/24"
}

variable "ssh_cidr" {
  type        = string
  description = "CIDR allowed to SSH to EC2. For practice only, 0.0.0.0/0 is open."
  default     = "0.0.0.0/0"
}

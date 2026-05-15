variable "subnet_cidr_block" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = false
}

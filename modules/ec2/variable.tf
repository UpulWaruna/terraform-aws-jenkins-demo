variable "instance_type" {
  type = string
}

variable "instance_tag_name_prefix" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "instance_ami" {
  type = string
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where EC2 instance will be created"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs attached to EC2"
}

variable "associate_public_ip_address" {
  type    = bool
  default = false
}

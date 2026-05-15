module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "subnet_public" {
  source                  = "./modules/subnet"
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr_block       = var.public_subnet_cidr_block
  name_prefix             = "${var.env}-public"
  map_public_ip_on_launch = true
}

module "subnet_private" {
  source                  = "./modules/subnet"
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr_block       = var.private_subnet_cidr_block
  name_prefix             = "${var.env}-private"
  map_public_ip_on_launch = false
}

module "internet_gateway" {
  source      = "./modules/internet-gateway"
  vpc_id      = module.vpc.vpc_id
  name_prefix = var.env
}

module "route_table" {
  source      = "./modules/route-table"
  vpc_id      = module.vpc.vpc_id
  gateway_id  = module.internet_gateway.gateway_id
  name_prefix = var.env
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = module.subnet_public.subnet_id
  route_table_id = module.route_table.route_table_id
}

module "security_group" {
  source      = "./modules/security-group"
  vpc_id      = module.vpc.vpc_id
  name_prefix = var.env
  ssh_cidr    = var.ssh_cidr
}

data "aws_ssm_parameter" "amazon_linux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

module "ec2" {
  source = "./modules/ec2"

  instance_count              = var.instance_count
  instance_type               = var.instance_type
  instance_tag_name_prefix    = var.instance_tag_name_prefix
  instance_ami                = data.aws_ssm_parameter.amazon_linux_2023.value
  subnet_id                   = module.subnet_public.subnet_id
  security_group_ids          = [module.security_group.security_group_id]
  associate_public_ip_address = true

  depends_on = [
    aws_route_table_association.public_subnet_association
  ]
}

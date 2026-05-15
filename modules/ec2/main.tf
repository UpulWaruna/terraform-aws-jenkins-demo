resource "aws_instance" "ec2_instance" {
  count = var.instance_count

  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address

  user_data = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "Hello from Terraform EC2 $(hostname)" > /usr/share/nginx/html/index.html
  EOF

  tags = {
    Name = "${var.instance_tag_name_prefix}-${count.index + 1}"
  }
}

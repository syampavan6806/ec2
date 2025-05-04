resource "aws_instance" "ec2_instance" {
  ami = var.ami_id
  availability_zone = var.availability_zone
  instance_type = var.instance_type
  tags = var.tags
  vpc_security_group_ids = [ aws_security_group.security_group.id ]
}

resource "aws_security_group" "security_group" {
    name = var.security_group_name
    description = var.security_group_description

    dynamic "ingress" {
        for_each = var.security_group_inbound_rules
        content {
          from_port = ingress.value.from_port
          to_port = ingress.value.to_port
          protocol = ingress.value.protocol
          cidr_blocks = ingress.value.cidr_blocks
          description = ingress.value.description
        }
    }

    tags = var.sg_tags
  
}
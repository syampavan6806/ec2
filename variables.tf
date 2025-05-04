variable "ami_id" {
    type = string
    description = "ami-id of ec2 instance"
}

variable "instance_type" {
   type = string
   description = "type of the ec2 instance"  
}

variable "availability_zone" {
    type = string
    description = "In what availability zone the ec2 instance is created"
}

variable "tags" {
    type = map(string)
    description = "tags of the instance"
}

variable "security_group_name" {
    type = string
    description = "name of the security group"
}

variable "security_group_description" {
    type = string
    description = "description about security group"
}

variable "security_group_inbound_rules" {
    type = list(object({
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
      description = string 
    }))
    
    description = "security group inbound rules"
  
}

variable "sg_tags" {
    type = map(string)
    description = "tags for security group"
}
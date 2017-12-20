### From *.tfvars
variable "aws_key_name" {
  type    = "string"
  default = "hp-key-pair"
}
variable "environment" {
  type    = "string"
  default = "test"
}
variable "consul_encrypt" {
  type = "string"
  default = "F+7/vsMXW9VAWg5QHdI5bw=="
}

### Defaults
variable "aws_region" {
  type    = "string"
  default = "eu-west-1"
}
variable "asg_instance_count_min" {
  type    = "string"
  default = "3"
}
variable "asg_instance_count_max" {
  type    = "string"
  default = "3"
}
variable "aws_ami_name" {
  type    = "string"
  default = "ubuntu-consul-server-*"
}
variable "aws_instance_type" {
  type    = "string"
  default = "t2.micro"
}
variable "ec2_tag_key" {
  type    = "string"
  default = "JoinBy"
}
variable "ec2_tag_value" {
  type    = "string"
  default = "consul-cluster"
}
variable "app_name" {
  type    = "string"
  default = "hugo"
}
variable "domain" {
  type    = "string"
  default = "hugo"
}
variable "team" {
  type    = "string"
  default = "hugo"
}
variable "has_public_ip" {
  type    = "string"
  default = "true"
}
variable "wait_for_capacity_timeout" {
  type    = "string"
  default = "5m"
}
variable "cidr_blocks" {
  type = "list"
  default = []
}


#variable "aws_region" {
#  type = "string"
#}
#variable "aws_key_name" {
#  type = "string"
#}
#variable "asg_instance_count_min" {
#  type = "string"
#}
#variable "asg_instance_count_max" {
#  type = "string"
#}
#variable "aws_ami_name" {
#  type = "string"
#}
#variable "aws_instance_type" {
#  type = "string"
#}
#variable "ec2_tag_key" {
#  type = "string"
#}
#variable "ec2_tag_value" {
#  type = "string"
#}
#variable "app_name" {
#  type = "string"
#}
#variable "domain" {
#  type = "string"
#}
#variable "environment" {
#  type = "string"
#}
#variable "team" {
#  type = "string"
#}
#variable "has_public_ip" {
#  type = "string"
#}
#variable "wait_for_capacity_timeout" {
#  type = "string"
#}
#variable "consul_encrypt" {
#  type = "string"
#}
#variable "cidr_blocks" {
#  type = "list"
#}

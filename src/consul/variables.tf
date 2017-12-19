### From *.tfvars
variable "aws_key_name" {
  type    = "string"
}
variable "environment" {
  type    = "string"
}
variable "consul_encrypt" {
  type = "string"
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
  default = "demo"
}
variable "domain" {
  type    = "string"
  default = "sample"
}
variable "team" {
  type    = "string"
  default = "team"
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
  default = ["192.168.0.0/16", "10.0.0.0/8", "77.60.83.148/32", "83.85.104.186/32"]
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

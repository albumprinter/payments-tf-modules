variable "aws_ami_name_prefix" {
  type = "string"
}
variable "aws_instance_type" {
  type = "string"
}
variable "aws_key_name" {
  type = "string"
}
variable "associate_public_ip" {
  type = "string"
}
variable "asg_instance_count_min" {
  type = "string"
}
variable "asg_instance_count_max" {
  type = "string"
}
variable "elb_name" {
  type    = "list"
  default = []
}
variable "security_groups" {
  type = "list"
}
variable "vpc_zone_subnet_ids" {
  type = "list"
}
variable "instance_profile_name" {
  type = "string"
}
variable "ec2_join_tag_key" {
  type = "string"
}
variable "ec2_join_tag_value" {
  type = "string"
}
variable "team" {
  type    = "string"
  default = "payments"
}
variable "domain" {
  type    = "string"
  default = "payments"
}
variable "environment" {
  type = "string"
}
variable "app_name" {
  type = "string"
}
variable "template_file" {
  type = "string"
}
variable "template_file_options" {
  type = "map"
}
variable "wait_for_capacity_timeout" {
  type = "string"
  default = "5m"
}

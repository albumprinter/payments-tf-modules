variable "aws_region" {
  type = "string"
}
variable "aws_key_name" {
  type = "string"
}
variable "asg_instance_count_min" {
  type = "string"
}
variable "asg_instance_count_max" {
  type = "string"
}
variable "aws_ami_name" {
  type = "string"
}
variable "aws_instance_type" {
  type = "string"
}
variable "ec2_tag_key" {
  type = "string"
}
variable "ec2_tag_value" {
  type = "string"
}
variable "app_name" {
  type = "string"
}
variable "domain" {
  type = "string"
}
variable "environment" {
  type = "string"
}
variable "team" {
  type = "string"
}
variable "has_public_ip" {
  type = "string"
}
variable "wait_for_capacity_timeout" {
  type = "string"
}
variable "consul_encrypt" {
  type = "string"
}
variable "cidr_blocks" {
  type = "list"
}
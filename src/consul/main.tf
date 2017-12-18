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
#variable "credentials_profile" {
#  type = "string"
#}
variable "hugo_paredes" {
  type = "string"
}

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.credentials_profile}"
}

module "availability_zones" {
  source = "../core/data/availability_zones"
}

module "aws_roles" {
  source      = "../core/resources/iam/roles/describe_instance"
  domain      = "${var.domain}"
  environment = "${var.environment}"
  team        = "${var.team}"
  app_name    = "${var.app_name}"
}

module "security_group" {
  source      = "../core/resources/ec2/network_security/security_groups/consul/server"

  domain      = "${var.domain}"
  environment = "${var.environment}"
  team        = "${var.team}"
  app_name    = "${var.app_name}"
  vpc_id      = "${module.availability_zones.vpc_id}"
  cidr_blocks = "${var.cidr_blocks}"
}

module "tf_options" {
  source = "../core/values/map"

  value  = {
    bootstrap_expect      = "${var.asg_instance_count_min}"
    consul_join_tag_key   = "${var.ec2_tag_key}"
    consul_join_tag_value = "${var.ec2_tag_value}"
    consul_encrypt        = "${var.consul_encrypt}"
  }
}

module "auto_scaling" {
  source                    = "../core/resources/ec2/auto_scaling"

  aws_ami_name_prefix       = "${var.aws_ami_name}"
  template_file_options     = "${module.tf_options.value}"
  aws_key_name              = "${var.aws_key_name}"
  app_name                  = "${var.app_name}"
  domain                    = "${var.domain}"
  team                      = "${var.team}"
  asg_instance_count_min    = "${var.asg_instance_count_min}"
  asg_instance_count_max    = "${var.asg_instance_count_max}"
  environment               = "${var.environment}"
  template_file             = "${file("${path.module}/scripts/ec2_userdata.sh")}"
  associate_public_ip       = "${var.has_public_ip}"
  aws_instance_type         = "${var.aws_instance_type}"
  ec2_join_tag_key          = "${var.ec2_tag_key}"
  ec2_join_tag_value        = "${var.ec2_tag_value}"
  security_groups           = "${module.security_group.ids}"
  instance_profile_name     = "${module.aws_roles.instance_profile_name}"
  vpc_zone_subnet_ids       = "${module.availability_zones.public_subnet_ids}"
  wait_for_capacity_timeout = "${var.wait_for_capacity_timeout}"
}

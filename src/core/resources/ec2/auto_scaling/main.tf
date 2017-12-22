module "data_ami" {
  source   = "git@github.com:albumprinter/payments-tf-modules.git//src/core/data/aws_ami"
#  source = "../../../data/aws_ami"
  ami_name = "${var.aws_ami_name_prefix}"
}

data "template_file" "template_file" {
  template = "${var.template_file}"

  vars = "${var.template_file_options}"
}

resource "aws_launch_configuration" "lc" {
  image_id                    = "${module.data_ami.id}"
  instance_type               = "${var.aws_instance_type}"
  name_prefix                 = "${var.environment}-${var.app_name}-node-"
  key_name                    = "${var.aws_key_name}"
  iam_instance_profile        = "${var.instance_profile_name}"
  associate_public_ip_address = "${var.associate_public_ip}"
  user_data                   = "${data.template_file.template_file.rendered}"
  security_groups             = ["${var.security_groups}"]
  placement_group             = "${var.placement_group_name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name_prefix               = "${var.environment}-${var.app_name}-"
  depends_on                = [
    "aws_launch_configuration.lc"]
  launch_configuration      = "${aws_launch_configuration.lc.name}"
  min_size                  = "${var.asg_instance_count_min}"
  max_size                  = "${var.asg_instance_count_max}"
  vpc_zone_identifier       = ["${var.vpc_zone_subnet_ids}"]
  load_balancers            = ["${var.elb_name}"]
  wait_for_capacity_timeout = "${var.wait_for_capacity_timeout}"

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "${var.environment}-${var.team}-${var.app_name}-${var.domain}"
  }
  tag {
    key                 = "${var.ec2_join_tag_key}"
    propagate_at_launch = true
    value               = "${var.ec2_join_tag_value}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "instance_profile_name" {
  value = "${aws_iam_instance_profile.consul_instance_profile.name}"
}

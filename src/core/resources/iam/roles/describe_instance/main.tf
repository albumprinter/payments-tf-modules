resource "aws_iam_policy" "leader_discovery" {
  name = "${var.environment}-${var.domain}-${var.app_name}-policy"
  path        = "/"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1468377974000",
            "Effect": "Allow",
            "Action": [
                "autoscaling:DescribeAutoScalingInstances",
                "ec2:DescribeInstances"
            ],
            "Resource": ["*"]
        }
    ]
}
    EOF
}

resource "aws_iam_role" "instance_role" {
  name = "${var.environment}-${var.domain}-${var.app_name}-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "instance_leader_discovery" {
  name       = "${var.environment}-${var.domain}-${var.app_name}-${uuid()}"
  roles      = ["${aws_iam_role.instance_role.name}"]
  policy_arn = "${aws_iam_policy.leader_discovery.arn}"
}

resource "aws_iam_instance_profile" "consul_instance_profile" {
  name = "${var.environment}-${var.domain}-${var.app_name}-${uuid()}"
  role = "${aws_iam_role.instance_role.name}"
}

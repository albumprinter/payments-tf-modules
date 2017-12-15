data "aws_ami" "ami_data" {
  most_recent = "${var.most_recent}"

  filter {
    name   = "name"
    values = ["${var.ami_name}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

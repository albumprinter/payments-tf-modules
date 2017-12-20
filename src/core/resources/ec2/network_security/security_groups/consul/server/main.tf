resource "aws_security_group" "consul_server" {
  name   = "${var.environment}-${var.app_name}-${var.team}-${var.domain}-sg"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks}"]
  }
  ingress {
    from_port   = "8500"
    to_port     = "8500"
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks}"]
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks}"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Team        = "${var.team}"
    Name        = "${var.environment}-${var.app_name}-${var.team}-${var.domain}-sg"
    Environment = "${var.environment}"
    Description = "Consul server Security Group for '${var.app_name}' created by ${var.team}"
  }
}

data "aws_vpc" "main" {
  tags {
    Name = "main"
  }
}

data "aws_availability_zones" "availability_zones" {}

data "aws_subnet" "public" {
  vpc_id              = "${data.aws_vpc.main.id}"
  availability_zone   = "${element(sort(data.aws_availability_zones.availability_zones.names), count.index)}"

  tags {
    Name = "public-*"
  }

  count = "2"
}

data "aws_subnet" "private" {
  vpc_id              = "${data.aws_vpc.main.id}"
  availability_zone   = "${element(sort(data.aws_availability_zones.availability_zones.names), count.index)}"

  tags {
    Name = "private-*"
  }

  count = "2"
}

output "vpc_id" {
  value = "${data.aws_vpc.main.id}"
}

output "cidr_blocks" {
  value = ["${data.aws_vpc.main.cidr_block}"]
}

output "public_subnet_ids" {
  value = ["${data.aws_subnet.public.*.id}"]
}

output "private_subnet_ids" {
  value = ["${data.aws_subnet.private.*.id}"]
}

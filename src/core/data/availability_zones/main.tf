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

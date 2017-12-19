output "vpc_id" {
  value = "${data.aws_vpc.main.id}"
}

output "vpc_cidr_blocks" {
  value = ["${data.aws_vpc.main.cidr_block}"]
}

output "public_subnet_cidr_blocks" {
  value = ["${data.aws_subnet.public.*.cidr_block}"]
}

output "public_subnet_ids" {
  value = ["${data.aws_subnet.public.*.id}"]
}

output "private_subnet_ids" {
  value = ["${data.aws_subnet.private.*.id}"]
}

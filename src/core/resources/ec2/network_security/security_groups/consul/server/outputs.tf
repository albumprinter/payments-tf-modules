output "ids" {
  value = ["${aws_security_group.consul_server.id}"]
}

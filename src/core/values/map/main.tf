variable "value" {
  type = "map"
}
output "value" {
  value = "${var.value}"
}
variable "region" {}
variable "cidr_blocks" {
  type = list(string)
}
variable "avail_zone" {
  type = list(string)
}
variable "env_prefix" {}
variable "default_route" {}
variable "image_name" {}
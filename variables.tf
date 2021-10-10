variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "ap-southeast-1"
}
variable "path_to_public_key" {
  description = "public key"
  default     = "bastionkey.pub"
}

variable "path_to_private_key" {
  description = "private key"
  default     = "bastionkey"
}
variable "vpc_id" {
  description = "Vpc id"
  default     = "vpc-0ad3c9d5d58f45c04"
}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-east-1"
}
variable "path_to_public_key" {
  description = "public key"
  default     = "webkey.pub"
}

variable "path_to_private_key" {
  description = "private key"
  default     = "webkey"
}
# variable "ami" {
#   type = map(any)
#   default = {
#     ap-southeast-1 = "ami-03a4a9b0b0197b758"
#   }
# }
# variable "project" {
#   description = "Project tag."
#   default     = "dev-project"
# }

variable "instance_type" {
  description = "The type of instance to start."
  default     = "t3.micro"
}

# variable "disk_size" {
#   description = "The size of the root volume in gigabytes."
#   default     = 10
# }

variable "path" {
  description = "The size of the root volume in gigabytes." 
  default = "ATG27ZPXDSQSWFCH6XSNPLLB676FK"
}
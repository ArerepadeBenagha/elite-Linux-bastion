# module "bastion" {
#   source            = "./modules/aws-linux-bastion/"
#   vpc_id            = data.aws_vpc.main.id
#   ami_id            = "ami-03a4a9b0b0197b758"
#   subnet_id         = aws_subnet.main-public-1.id
#   ssh_key           = "bastionkey"
#   internal_networks = "10.0.0.0/16"
#   disk_size         = 10
#   instance_type     = "t2.micro"
#   project           = "myProject"
# }
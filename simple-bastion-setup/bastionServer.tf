resource "aws_instance" "server" {
  ami                    = "ami-0a8b4cd432b1c3063"#data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.main-public-1.id
  key_name               = aws_key_pair.bastionkey.key_name
  vpc_security_group_ids = [aws_security_group.bastion.id]

  user_data_base64 = data.cloudinit_config.userdata.rendered
  tags = merge(local.common_tags,
    { Name = "bastion-server"
  Application = "public" })
}

/* ngnix server */
# resource "aws_instance" "nginxserver" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = var.instance_type
#   subnet_id              = aws_subnet.main-private-1.id
#   key_name               = aws_key_pair.bastionkey.key_name
#   vpc_security_group_ids = [aws_security_group.bastion.id]

#   user_data_base64 = data.cloudinit_config.userdata.rendered
#   lifecycle {
#     ignore_changes = [ami, user_data_base64]
#   }

#   tags = merge(local.common_tags,
#     { Name = "Nginx-server"
#   Application = "public" })
# }

# resource "aws_instance" "nginxserver" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = var.instance_type
#   subnet_id              = aws_subnet.main-public-1.id
#   key_name               = aws_key_pair.mykeypair.key_name
#   vpc_security_group_ids = [aws_security_group.bastion.id]

#   connection {
#     # The default username for our AMI
#     user        = "ubuntu"
#     host        = self.public_ip
#     type        = "ssh"
#     private_key = file(var.path)
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update -yq",
#       "export RUNNER_ALLOW_RUNASROOT=true",
#       "mkdir actions-runner && cd actions-runner",
#       "curl -O -L https://github.com/actions/runner/releases/download/v2.262.1/actions-runner-linux-x64-2.262.1.tar.gz",
#       "tar xzf ./actions-runner-linux-x64-2.262.1.tar.gz",
#       "token=$(curl -s -XPOST-H "authorization: token $PAT" \
# https://api.github.com/repos/ArerepadeBenagha/https://github.com/elitecloud/actions/runners/registration-token |\
# jq -r .token)"
      
#     ]
#   }
#   tags = merge(local.common_tags,
#     { Name = "server"
#   Application = "public" })
# }
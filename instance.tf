# Ec2-instance
resource "aws_instance" "dummy" {
  ami           = "ami-03a4a9b0b0197b758"
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.main-private-1.id
  key_name      = aws_key_pair.mykeypair.key_name

  vpc_security_group_ids = [aws_security_group.main-sg.id]

  tags = merge(local.common_tags, { Name = "dummy-vm" })
}
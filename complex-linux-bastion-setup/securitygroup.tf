resource "aws_security_group" "main-sg" {
  vpc_id      = aws_vpc.main.id
  name        = "Main-SG"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.210/32"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.210/32"]
  }
  tags = merge(local.common_tags, { Name = "main-sg" })
}
/* securitygroup */

resource "aws_security_group" "server" {
  vpc_id      = aws_vpc.main.id
  name        = "public web ngnix sg"
  description = "security group Ec2-server"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  tags = merge(local.common_tags,
  { Name = "Ec2 security group" })
}

resource "aws_security_group" "bastion" {
  vpc_id      = aws_vpc.main.id
  name        = "public web allow"
  description = "security group for ALB"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags,
  { Name = "Alb security group" })
}
resource "aws_key_pair" "bastionkey" {
  key_name   = "bastionkey"
  public_key = file(var.path_to_public_key)
}
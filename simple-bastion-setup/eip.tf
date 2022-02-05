/* EIP */
# resource "aws_eip" "eip" {
#   instance = aws_instance.nginxserver.id
#   vpc      = true

#   depends_on = [aws_internet_gateway.main-gw]
#   tags = merge(local.common_tags,
#     { Name = "eip"
#   Application = "public" })
# }
# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.nginxserver.id
#   allocation_id = aws_eip.eip.id
# }
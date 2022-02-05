# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.eip.id
#   subnet_id     = aws_subnet.main-public-1.id

#   tags = merge(local.common_tags,
#     { Name = "nat"
#   Application = "public" })

#   depends_on = [aws_internet_gateway.main-gw]
# }

# resource "aws_route" "privatenat" {
#   route_table_id         = aws_route_table.main-public.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat.id

#   timeouts {
#     create = "20m"
#   }
# }
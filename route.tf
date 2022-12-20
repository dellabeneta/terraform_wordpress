resource "aws_route" "route" {
  route_table_id = aws_vpc.vpc.default_route_table_id
  //nat_gateway_id         = aws_nat_gateway.ngw.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
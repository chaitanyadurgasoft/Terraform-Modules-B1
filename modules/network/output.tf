output "vpc_id" {
    value=aws_vpc.mod_vpc.id
}

output "vpc_name" {
    value=var.vpc_name
}

output "Public_Subnet_Id" {
  value=aws_subnet.mod_PublicSubnet.*.id
}

output "Private_Subnet_Id" {
  value=aws_subnet.mod_PrivateSubnet.*.id
}

output "Public_routetable_id" {
    value = aws_route_table.mod_Public_Table.id
}
output "Private_routetable_id" {
    value = aws_route_table.mod_Private_Table.id
}
output "IGW_ID" {
 value=aws_internet_gateway.mod_igw.id 
}

output "Public_subnet_1" {
 value=aws_subnet.mod_PublicSubnet.0.id
}

output "env" {
  value=var.env
}
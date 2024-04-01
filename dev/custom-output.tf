output "vpcname" {
  value = module.dev_vpc.vpc_name
}

output "vpcid" {
  value = module.dev_vpc.vpc_id
}

output "nat_id" {
  value = module.dev_nat.natgwid
}
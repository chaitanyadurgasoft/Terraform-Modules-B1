module "dev_ec2" {
  source = "../modules/ec2"
  env    = module.dev_vpc.env
  ami = {
    us-east-1 = "ami-0cd59ecaf368e5ccf",
    us-east-2 = "ami-0b8b44ec9a8f90422"
  }
  key = {
    us-east-1 = "AWS_Default",
    us-east-2 = "AWS_Default_OHIO"
  }
  Public_subnet_id  = module.dev_vpc.Public_Subnet_Id
  Private_subnet_id = module.dev_vpc.Private_Subnet_Id
  security          = module.dev_sg.sg_id
  vpc_name          = module.dev_vpc.vpc_name
  region            = var.region
  instance_type     = "t2.micro"
  depends_on        = [module.dev_nat.natgwid]
}

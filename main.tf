module "myvpc" {

  source = "./VPC"
vpc-cidr = var.prodcidr
  
}

module "server-1" {

  source = "./EC2"
  vpc_id = module.myvpc.vpc_id
  subnet_id = module.myvpc.aws_public_subnets[0]
  
}
module "server-2" {

  source = "./EC2"
  vpc_id = module.myvpc.vpc_id
  subnet_id = module.myvpc.aws_public_subnets[1]
  
}

module "alb" {
source = "./ALB"
  instance = [module.server-1,module.server-2]
  vpc_id = module.myvpc.vpc_id
  subnets = module.myvpc.aws_public_subnets
  
}



module "myvpc" {

  source = "./VPC"
vpc-cidr = var.prodcidr
  
}



module "server-1" {

  source = "./EC2"
  vpc_id = module.myvpc.vpc_id
  subnet_id = module.myvpc.aws_public_subnets[0]
  ec2_count = var.count
}
# module "server-2" {

#   source = "./EC2"
#   vpc_id = module.myvpc.vpc_id
#   subnet_id = module.myvpc.aws_public_subnets[1]
  
# }

# module "alb" {
# source = "./ALB"
#   instance_1 = module.server-1.aws_instance_1
#   instance_2 = module.server-2.aws_instance_2
#   vpc_id = module.myvpc.vpc_id
#   subnets = module.myvpc.aws_public_subnets
  
# }



module "myvpc" {

  source   = "./VPC"
  vpc-cidr = var.prodcidr
  bucket = module.s3.s3_bucket_arn
}

module "server-1" {

  source    = "./EC2"
  ec2_count = var.number
  vpc_id    = module.myvpc.vpc_id
  subnet_id = module.myvpc.aws_public_subnets[0]
  kmskey = module.kms.key_id
}

module "alb" {
  source     = "./ALB"
  instance_1 = module.server-1.aws_instance_1
  instance_2 = module.server-1.aws_instance_2
  vpc_id     = module.myvpc.vpc_id
  subnets    = module.myvpc.aws_public_subnets[0]

}

module "s3" {
  source     = "./S3"
  bucketname = var.bucketname
  versioning = true

}
module "kms" {
source ="./KMS"
  alias_name = var.environment
  deletion_window_in_days =var.deletion_age
  enable_key_rotation = var.keyrotaion
  is_enabled = var.key_enable
  iam_policy = var.policy
}

module "ami" {
  source ="./AMI"
  instance = module.server-1.aws_instance_1.id
  environment = var.environment
}

module "RDS" {
  
  source = "./RDS"
environment = var.environment
vpc_id =module.myvpc.vpc_id
subnet_ids = module.myvpc.aws_public_subnets
az = var.az
identifier = var.identifier
engine = var.engine
multi_az = true
engine_version = var.engine_version
parametergroup = var.parametergroup
instancetype = var.instance_type
db_name = "${var.environment}-database"
username = var.username
password = var.password
port = "3306"
snapshot = true
protection =true
kmskey = module.kms.key_id

}

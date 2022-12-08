output "vpc_id" {
    description = "The id of VPC"
    value = aws_vpc.vpc.id
} 
output "aws_public_subnets" {
description = "vpc public subnets"
value = [aws_subnet.public_subnet_1.id,aws_subnet.public_subnet_2.id]
}
output "aws_rivate_subnets" {
description = "vpc private subnets"
value = [aws_subnet.private_subnet_1.id,aws_subnet.private_subnet_2.id]
}
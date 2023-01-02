output "aws_instance_1" {
description = "ec2 instance Id"
value = aws_instance.deepdive[0].id
}
output "aws_instance_2" {
description = "ec2 instance Id"
value = aws_instance.deepdive[1].id
}


output "aws_instance_1" {
description = "ec2 instance Id"
value = aws_instance.*.id
}

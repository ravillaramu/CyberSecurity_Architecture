output "aws_instance" {
description = "ec2 instance Id and Ip Address"
value = [aws_instance.deepdive.id,aws_instance.deepdive.id]
}


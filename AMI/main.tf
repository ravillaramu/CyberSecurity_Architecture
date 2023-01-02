resource "aws_ami_from_instance" "ami" {
  name               = "${var.environment}-ami"
  source_instance_id = var.instance
}
#create ec2-instance

resource "aws_instance" "deepdive" {
  ami           = "${var.instance-ami}"
  instance_type = "${var.instance_type}"
  ebs_block_device {
  # incresing the  ebs volume size 
    device_name = "/dev/xvda"
    volume_size = 10
  }
  kms_key_name = var.kmskey
  count = var.ec2_count
  user_data = "${file("./EC2/script.sh")}"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.deepdive_security_group.id]
  tags = {
    Name = "${var.environment}-server-${count.index + 1}"
  }
}

# resource "aws_ebs_encryption_by_default" "encrypt_ebs" {

#     enabled = true
  
# }

# # creating extra ebs volume and attching to ec2 instance
# resource "aws_ebs_volume" "deepdive_ebs" {
#   availability_zone = "us-east-1a"
#   size              = 40
#   tags = {
#     Name = "${var.environment}-ebs"
#   }
# }

# resource "aws_volume_attachment" "deepdive_ebs_attachment" {
  
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.deepdive_ebs.id
#   instance_id = aws_instance.deepdive.id
# }



# Security Group

resource "aws_security_group" "deepdive_security_group" {
  name        = "deepdive"
  vpc_id      =  var.vpc_id
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
      ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
    tags = {
  Name        = "${var.environment}-securitygroup"
    }

}
# Create Elastic IP
# resource "aws_eip" "eip" {
#   vpc              = true
#   public_ipv4_pool = "amazon"
#   tags = {
#   Name        = "${var.environment}-eip"
# }
# }
# resource "aws_eip_association" "eip_association" {
#   instance_id   = aws_instance.deepdive.id
#   allocation_id = aws_eip.eip.id
# }
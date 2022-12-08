
#Create Target groups 

resource "aws_lb_target_group" "targetgroup_1" {
  name        = "${var.environment}-tg1"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group" "targetgroup_2" {
  name        = "${var.environment}-tg2"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_id
}

# adding instances to target group
resource "aws_lb_target_group_attachment" "tga_1" {
  target_group_arn = aws_lb_target_group.targetgroup_1.arn
  target_id        = var.instance[0]
  port             = 80
}

resource "aws_lb_target_group_attachment" "tga_2" {
  target_group_arn = aws_lb_target_group.targetgroup_2.arn
  target_id        = var.instance[1]
  port             = 80
}



# Security Group

resource "aws_security_group" "deepdive_security_group" {
  name        = "deepdive"
  vpc_id      =  var.vpc_id
  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port   = 443
      to_port     = 443
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
  Name        = "${var.environment}-alb-securitygroup"
    }

}



#creating loadbalncer

resource "aws_lb" "alb" {
  name               = "${var.environment}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = aws_security_group.deepdive_security_group.id
  subnets            = var.subnets

  enable_deletion_protection = false
  tags = {
    Environment = "deepdive"
  }
}


# addning listeners to alb


resource "aws_lb_listener" "listener_eureka" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetgroup_1.arn
  }
}

resource "aws_lb_listener" "listener_config" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetgroup_2.arn
  }
}



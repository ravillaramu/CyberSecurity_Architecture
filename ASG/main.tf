

resource "aws_autoscaling_group" "asg" {
  name                      = var.environment
  max_size                  = 4
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  availability_zones = var.az

  
  
  launch_template {
    id      = aws_launch_template.launch_templet.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "launch_templet" {
  name  = "${var.environment}-launch-templet"
  image_id      = var.ami
  instance_type = "${var.instance_type}"
}
# resource "aws_autoscaling_policy" "example" {
#   autoscaling_group_name = aws_autoscaling_group.bar.name
#   name                   = "CPU-Tracking"
#   policy_type            = "TargetTrackingScaling"
#    target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = 70.0
#   }
# }

resource "aws_db_instance" "db_instance" {
  allocated_storage    = var.storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.version
  instance_class       = var.class
  username             = var.username
  password             = var.password
  skip_final_snapshot  = false
}

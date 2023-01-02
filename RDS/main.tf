
resource "aws_db_subnet_group" "database_subnets" {
 
  subnet_ids  = var.subnet_ids
  tags = {
    Name        = "${var.environment}-DBsub"
    Environment = "${var.environment}"
  } 
}
resource "aws_security_group" "rds_sg" {
    vpc_id      = var.vpc_id

    ingress {
        protocol        = "tcp"
        from_port       = 3306
        to_port         = 3306
        cidr_blocks     = ["0.0.0.0/0"]
        
    }

    egress {
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}
resource "aws_db_instance" "Amazon-Aurora" {
    identifier                = var.identifier
    # allocated_storage         = var.storage
    backup_retention_period   = var.backup
    multi_az                  = var.multi_az
    engine                    = var.engine
    engine_version            = var.engine_version
    instance_class            = var.instancetype
    db_name                   = var.db_name
    username                  = var.username
    password                  = var.password
    port                      = var.port
    db_subnet_group_name      = aws_db_subnet_group.database_subnets.id
    parameter_group_name      = var.parametergroup
    vpc_security_group_ids    = [aws_security_group.rds_sg.id]
    skip_final_snapshot       = var.snapshot
    deletion_protection       = var.protection 
    kms_key_id                = var.kmskey
    # need to add kms
}




variable "environment" {

}

variable "vpc_id" {
  
}
variable "subnet_ids" {
  
}

variable "az" {
 type    =list(any)
 default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}
variable "identifier" {
  default = "amazon-aurora"
}
# variable "storage" {
#   default = "20"
# }
variable "backup" {
  default = "30"
}
variable "engine"{
  default = "amazon-aurora"
}
variable "multi_az"{
  default = "false"
}
variable "engine_version"{
  default = "Aurora(MySQL 5.7)2.10.2"
}
variable "parametergroup"{
  default = "default.aurora-mysql5.7"
}

variable "instancetype"{
  default = "db.t3.medium"
}
variable "db_name"{
}
variable "username"{
  default = "Admin"
}
variable "password"{
  default = "Admin123"
}
variable "port"{
  default = "3306"
}
variable "snapshot"{
  default = "false"
}

variable "protection"{
  default = "false"
}






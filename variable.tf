variable "prodcidr" {
  default = "10.0.0.0/16"
}
variable "environment" {
  default = "diffence_in_depth"
}
variable "number" {
  default = "2"
}
variable "bucketname" {
  default = "diffence-in-depth"
  
}
variable "deletion_age" {
  default = "7"
}

variable "keyrotaion" {

  default = false
  
}
variable "key_enable" {
  default = true
}
variable "policy" {
  default = null
}
variable "identifier" {
  default = "Amazon Aurora"
}
variable "engine" {
  default = "amazon-aurora"
}
variable "engine_version" {
  default = "Aurora(MySQL 5.7)2.10.2"
}
variable "parametergroup"{
  default = "default.aurora-mysql5.7"
}

variable "instance_type"{
  default = "db.t3.medium"
}
variable "username"{
  default = "Admin"
}
variable "password"{
  default = "Admin123"
}


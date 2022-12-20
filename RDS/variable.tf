variable "storage" {
  default = 20
}
variable "db_name" {
 default = "MariaDB " 
}
variable "engine" {
default = "mariadb"  
}
variable "version" {
  default = "10.6.11"
}
variable "class" {
  default = "db.t3.micro"
}
variable "username" {
  default = "Admin"
}
variable "password" {
  default = "Admin@123"
}


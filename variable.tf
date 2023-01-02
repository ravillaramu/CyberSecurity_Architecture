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
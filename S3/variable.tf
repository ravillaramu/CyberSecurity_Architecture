# This file contains the variable definitions
variable "bucketname" {
}
variable "acl" {
    default     = "private"
}
variable "versioning" {
    type        = bool
    default     = false
}


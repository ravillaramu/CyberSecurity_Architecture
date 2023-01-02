variable "alias_name" {

}

variable "deletion_window_in_days" {

}

variable "iam_policy" {
  description = "The policy of the key usage"
  type        = string
  default     = null
}

variable "is_enabled" {
  description = "(Optional) Specifies whether the key is enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "enable_key_rotation" {
  description = "(Optional) Specifies whether key rotation is enabled. Defaults to false."
  type        = bool
  default     = false
}

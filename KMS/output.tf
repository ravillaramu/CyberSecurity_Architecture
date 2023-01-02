output "key_arn" {
  description = "The Amazon Resource Name (ARN) of the key."
  value       = aws_kms_key.kms_key.arn
}

output "key_id" {
  description = "The globally unique identifier for the key."
  value       = aws_kms_key.kms_key.id
}

output "key_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = aws_kms_alias.kms-alias.arn
}

output "key_alias_name" {
  description = "The display name of the alias."
  value       = aws_kms_alias.kms-alias.name
}

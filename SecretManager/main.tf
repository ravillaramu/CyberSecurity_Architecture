# need to be update in modules


# resource "random_password" "password" {
# length = var.length
# special = var.special
# override_special = "_%@"
# }
resource "aws_secretsmanager_secret" "secretname" {
name = var.environment
}
resource "aws_secretsmanager_secret_version" "sversion" {
secret_id = aws_secretsmanager_secret.secretname.id
kms_key_id = var.kmskey
secret_string = <<EOF
{
username = var.username
password = var.password
#  password = "${random_password.password.result}"
}
EOF
}


#  need to be add kms encryption
# secret type for adding credentials
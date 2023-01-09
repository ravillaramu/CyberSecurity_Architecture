resource "random_password" "password" {
length = var.length
special = var.special
override_special = "_%@"
}
resource "aws_secretsmanager_secret" "secretmasterDB" {
name = var.secretname
}
resource "aws_secretsmanager_secret_version" "sversion" {
secret_id = aws_secretsmanager_secret.secretmasterDB.id
secret_string = <<EOF
{
"username": var.username
"password": "${random_password.password.result}"
}
EOF
}
data "aws_secretsmanager_secret" "secretmasterDB" {
arn = aws_secretsmanager_secret.secretmasterDB.arn
}
data "aws_secretsmanager_secret_version" "creds" {
secret_id = data.aws_secretsmanager_secret.secretmasterDB.arn
}
{

db_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string) }

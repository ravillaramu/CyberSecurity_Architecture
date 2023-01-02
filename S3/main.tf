resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucketname
  acl    = var.acl
  #Bucker versioning
versioning {
        enabled = var.versioning
    }
}
  #bucket_public_access_block
 resource "aws_s3_bucket_public_access_block" "s3-public-access" {
 
  bucket = aws_s3_bucket.s3-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
#aws vpc flow log
# resource "aws_flow_log" "mys3" {
# log_destination      = aws_s3_bucket.aws_s3_bucket.arn
#   log_destination_type = "s3"
#   traffic_type         = "ALL"
#   vpc_id               = aws_vpc.mys3.id
#   destination_options {
#     file_format        = "parquet"
#     per_hour_partition = true
#   }

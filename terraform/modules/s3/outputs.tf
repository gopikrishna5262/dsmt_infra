output "bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.static_content.id
}

output "bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.static_content.arn
}
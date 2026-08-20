resource "aws_s3_bucket" "static_content" {
  bucket = "${var.project_name}-static-content"
  force_destroy = true
  tags = {
    Name    = "${var.project_name}-static-content"
    Project = var.project_name
    Purpose = "nginx-static-content"
  }
}

resource "aws_s3_bucket_public_access_block" "static_content" {
  bucket = aws_s3_bucket.static_content.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "static_content" {
  bucket = aws_s3_bucket.static_content.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "static_content" {
  bucket = aws_s3_bucket.static_content.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
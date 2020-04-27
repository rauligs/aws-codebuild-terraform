provider "aws" {
  region = var.s3_bucket_region
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${var.s3_bucket_name}-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
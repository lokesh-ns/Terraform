resource "aws_s3_bucket" "sample_bucket" {
  bucket = "loki-bucket-samples-test2"
}

resource "aws_dynamodb_table" "sample_db_table" {
  name = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
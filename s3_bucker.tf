resource "aws_s3_bucket" "bucket-1" {
    bucket = "bucket-of-galaxy"
}

resource "aws_s3_bucket_ownership_controls" "bkt-own" {
    bucket = aws_s3_bucket.bucket-1.id

    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "acl-1" {
    depends_on = [aws_s3_bucket_ownership_controls.bkt-own]
    
    bucket = aws_s3_bucket.bucket-1.id
    acl = "private"
}
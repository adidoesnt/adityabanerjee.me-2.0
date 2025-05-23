# Timeline images bucket
resource "aws_s3_bucket" "timeline_images" {
  bucket = "abme-timeline-images"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.timeline_images.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.timeline_images.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.timeline_images.id}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.public_access_block]

  lifecycle {
    prevent_destroy = true
  }
}


# Directus bucket
resource "aws_s3_bucket" "directus" {
  bucket = "abme-directus"

  tags = {
    Name = "abme-directus"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "directus_public_access_block" {
  bucket = aws_s3_bucket.directus.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_policy" "directus_public_read_policy" {
  bucket = aws_s3_bucket.directus.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.directus.id}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.directus_public_access_block]

  lifecycle {
    prevent_destroy = true
  }
}

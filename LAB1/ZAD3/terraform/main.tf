resource "aws_s3_bucket" {
    bucket = "terrabucket"
}

resource "aws_s3_bucket_website_configuration" {
    bucket = "terrabucket"

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }

    routing_rule {
        condition {
            key_prefix_equals = "www/"
        }
        redirect {
            replace_key_prefix_with = "/"
        }
  }
}

resource "aws_s3_bucket_acl" {
    bucket = "terrabucket"
    acl = "private"
}

resource "aws_s3_bucket_policy" {
    bucket = "terrabucket"
    policy = "provider.tf"
}

resource "aws_s3_object" {
    
}
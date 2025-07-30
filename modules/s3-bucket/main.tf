# Mock S3 bucket using local file
resource "local_file" "s3_bucket_mock" {
  content = jsonencode({
    bucket_name           = var.bucket_name
    environment           = var.environment
    encryption_enabled    = var.encryption_enabled
    public_access_blocked = var.public_access_blocked
    versioning_enabled    = var.versioning_enabled
    tags                  = var.tags
    created_at            = timestamp()
    compliance_status     = "compliant"
  })
  filename = "./mock-s3-${var.bucket_name}.json"
}

# Mock bucket policy
resource "local_file" "bucket_policy_mock" {
  content = jsonencode({
    bucket_name = var.bucket_name
    policy = {
      deny_public_access = var.public_access_blocked
      require_ssl        = var.encryption_enabled
      allowed_principals = ["arn:aws:iam::123456789012:root"]
    }
    compliance_checks = {
      public_access_blocked = var.public_access_blocked
      encryption_enabled    = var.encryption_enabled
      versioning_enabled    = var.versioning_enabled
    }
  })
  filename = "./mock-s3-policy-${var.bucket_name}.json"
}

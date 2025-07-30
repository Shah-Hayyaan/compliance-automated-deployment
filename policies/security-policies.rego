package terraform.security

# Deny public S3 buckets
deny[msg] {
    input.resource_type == "aws_s3_bucket"
    input.config.acl == "public-read"
    msg := "S3 bucket must not have public-read ACL"
}

# Require encryption
deny[msg] {
    input.resource_type == "aws_s3_bucket"
    not input.config.server_side_encryption_configuration
    msg := "S3 bucket must have encryption enabled"
}

# Check for hardcoded secrets
deny[msg] {
    contains(input.config, "AKIA")
    msg := "Hardcoded AWS access key detected"
}

# Require tags
deny[msg] {
    input.resource_type == "aws_s3_bucket"
    not input.config.tags.Environment
    msg := "S3 bucket must have Environment tag"
}

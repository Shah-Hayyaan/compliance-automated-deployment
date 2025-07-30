output "bucket_name" {
  description = "Name of the created bucket"
  value       = var.bucket_name
}

output "bucket_config" {
  description = "Bucket configuration"
  value = {
    name                  = var.bucket_name
    environment           = var.environment
    encryption_enabled    = var.encryption_enabled
    public_access_blocked = var.public_access_blocked
    versioning_enabled    = var.versioning_enabled
  }
}

output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.app_storage.bucket_name
}

output "deployment_id" {
  description = "Unique deployment identifier"
  value       = random_id.deployment_id.hex
}

output "environment" {
  description = "Environment name"
  value       = var.environment
}

output "cloudtrail_config" {
  description = "CloudTrail configuration"
  value = {
    trail_name      = "${var.environment}-audit-trail"
    logging_enabled = true
  }
}

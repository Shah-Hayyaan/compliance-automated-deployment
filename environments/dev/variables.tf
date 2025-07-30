variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "my-app-dev-bucket"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "terraform-compliance"
    Owner       = "devops-team"
    CreatedBy   = "terraform"
  }
}

variable "enable_encryption" {
  description = "Enable encryption for storage"
  type        = bool
  default     = true
}

variable "public_access_block" {
  description = "Block public access to S3"
  type        = bool
  default     = true
}

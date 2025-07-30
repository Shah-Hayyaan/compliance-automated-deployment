variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}

variable "encryption_enabled" {
  description = "Enable bucket encryption"
  type        = bool
  default     = true
}

variable "public_access_blocked" {
  description = "Block public access to bucket"
  type        = bool
  default     = true
}

variable "versioning_enabled" {
  description = "Enable bucket versioning"
  type        = bool
  default     = true
}

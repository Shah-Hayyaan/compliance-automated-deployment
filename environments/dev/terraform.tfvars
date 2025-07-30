environment = "dev"
bucket_name = "my-app-dev-storage-bucket"
region      = "us-east-1"

common_tags = {
  Environment = "dev"
  Project     = "terraform-compliance-framework"
  Owner       = "devops-team"
  CreatedBy   = "terraform"
  CostCenter  = "engineering"
}

enable_encryption   = true
public_access_block = true

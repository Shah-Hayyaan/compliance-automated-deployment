environment = "uat"
bucket_name = "my-app-uat-storage-bucket"
region      = "us-east-1"

common_tags = {
  Environment = "uat"
  Project     = "terraform-compliance-framework"
  Owner       = "devops-team"
  CreatedBy   = "terraform"
  CostCenter  = "engineering"
}

enable_encryption   = true
public_access_block = true

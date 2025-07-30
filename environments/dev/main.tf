terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "local" {}
provider "random" {}

# Use module for standardized bucket creation
module "app_storage" {
  source = "../../modules/s3-bucket"

  bucket_name = var.bucket_name
  environment = var.environment
  tags        = var.common_tags
}

# Mock DynamoDB table using local file
resource "local_file" "dynamodb_mock" {
  content = jsonencode({
    table_name  = "${var.environment}-terraform-locks"
    environment = var.environment
    created_at  = timestamp()
  })
  filename = "./mock-dynamodb-${var.environment}.json"
}

# Mock IAM user
resource "local_file" "iam_user_mock" {
  content = jsonencode({
    username    = "${var.environment}-terraform-user"
    environment = var.environment
    policies    = ["S3FullAccess", "DynamoDBFullAccess"]
    created_at  = timestamp()
  })
  filename = "./mock-iam-${var.environment}.json"
}

# Mock CloudTrail - FIXED
resource "local_file" "cloudtrail_mock" {
  content = jsonencode({
    trail_name      = "${var.environment}-audit-trail"
    s3_bucket       = var.bucket_name # Changed from module output
    environment     = var.environment
    logging_enabled = true
    created_at      = timestamp()
  })
  filename = "./mock-cloudtrail-${var.environment}.json"
}

# Random resource for demonstration
resource "random_id" "deployment_id" {
  byte_length = 8
}

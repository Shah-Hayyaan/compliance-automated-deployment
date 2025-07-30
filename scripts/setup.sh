#!/bin/bash

set -e

echo "🚀 Setting up Terraform Compliance Framework..."

# Copy UAT and Prod environments from dev template
echo "📁 Creating environment configurations..."

# Copy dev to uat and prod
cp -r environments/dev/* environments/uat/
cp -r environments/dev/* environments/prod/

# Update UAT variables
sed -i 's/environment = "dev"/environment = "uat"/' environments/uat/terraform.tfvars
sed -i 's/dev-storage-bucket/uat-storage-bucket/' environments/uat/terraform.tfvars
sed -i 's/Environment = "dev"/Environment = "uat"/' environments/uat/terraform.tfvars

# Update Prod variables
sed -i 's/environment = "dev"/environment = "prod"/' environments/prod/terraform.tfvars
sed -i 's/dev-storage-bucket/prod-storage-bucket/' environments/prod/terraform.tfvars
sed -i 's/Environment = "dev"/Environment = "prod"/' environments/prod/terraform.tfvars

# Update variable defaults in UAT
sed -i 's/default     = "dev"/default     = "uat"/' environments/uat/variables.tf
sed -i 's/my-app-dev-bucket/my-app-uat-bucket/' environments/uat/variables.tf

# Update variable defaults in Prod
sed -i 's/default     = "dev"/default     = "prod"/' environments/prod/variables.tf
sed -i 's/my-app-dev-bucket/my-app-prod-bucket/' environments/prod/variables.tf

echo "✅ Environment configurations created"

# Initialize git hooks
echo "🔧 Setting up pre-commit hooks..."
pre-commit install

# Initialize terraform in each environment
echo "🏗️  Initializing Terraform environments..."
for env in dev uat prod; do
    echo "Initializing $env environment..."
    cd environments/$env
    terraform init
    terraform fmt
    cd ../..
done

echo "✅ Setup completed successfully!"
echo ""
echo "🎯 Next steps:"
echo "1. Create GitHub repository and push code"
echo "2. Set up GitHub environments (development, uat, production)"
echo "3. Create branches: dev, uat, main"
echo "4. Enable branch protection rules"
echo ""
echo "📋 Commands to run:"
echo "git add ."
echo "git commit -m 'Initial setup of terraform compliance framework'"
echo "git branch dev"
echo "git branch uat"
echo "git push -u origin main dev uat"

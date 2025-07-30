#!/bin/bash

set -e

ENVIRONMENT=${1:-dev}
WORKING_DIR="environments/$ENVIRONMENT"

echo "🔍 Running validation for $ENVIRONMENT environment..."

# Check if environment exists
if [ ! -d "$WORKING_DIR" ]; then
    echo "❌ Environment $ENVIRONMENT does not exist"
    exit 1
fi

cd "$WORKING_DIR"

echo "1️⃣ Formatting check..."
terraform fmt -check

echo "2️⃣ Terraform validation..."
terraform init -backend=false
terraform validate

echo "3️⃣ Security scan with tfsec..."
tfsec . --format json --out tfsec-validation.json || true

echo "4️⃣ Policy check with checkov..."
checkov -d . --framework terraform --output json --output-file checkov-validation.json || true

echo "5️⃣ Secret detection..."
gitleaks detect --source ../.. --verbose || true

echo "6️⃣ Terraform plan..."
terraform plan -out=validation.tfplan

echo "✅ Validation completed for $ENVIRONMENT"
echo "📊 Check tfsec-validation.json and checkov-validation.json for detailed results"

cd ../..

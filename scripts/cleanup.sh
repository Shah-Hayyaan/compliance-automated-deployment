#!/bin/bash

echo "🧹 Cleaning up terraform compliance framework..."

# Remove terraform files
find . -name "*.tfstate*" -delete
find . -name "*.tfplan" -delete
find . -name ".terraform" -type d -exec rm -rf {} + 2>/dev/null || true
find . -name ".terraform.lock.hcl" -delete

# Remove mock files
find . -name "mock-*.json" -delete

# Remove security scan results
find . -name "*tfsec*.json" -delete
find . -name "*checkov*.json" -delete
find . -name "gitleaks-report.json" -delete

# Remove build artifacts
rm -rf build/
rm -rf dist/

echo "✅ Cleanup completed"

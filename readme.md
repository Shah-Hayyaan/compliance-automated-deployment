# Terraform Compliance Framework

A complete CI/CD pipeline with security gates and compliance automation for Terraform infrastructure.

## 🎯 Features

- **Multi-Environment Support**: Dev, UAT, Production environments
- **Security Gates**: tfsec, checkov, gitleaks integration
- **Compliance Automation**: Policy-as-code with OPA
- **GitHub Actions CI/CD**: Automated deployment pipeline
- **Mock AWS Resources**: Free development setup

## 🚀 Quick Start

1. **Clone and Setup**
   ```bash
   git clone <your-repo>
   cd terraform-compliance-framework
   chmod +x scripts/setup.sh
   ./scripts/setup.sh

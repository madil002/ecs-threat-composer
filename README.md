# 🚀 AWS Threat Composer Deployment via ECS & Terraform

## Project Overview

## 📁 Project Structure
```
└── ECS-THREAT-COMPOSER
    ├── pre-commit-config.yaml
    ├── app/
    ├── terraform/
    │    ├── backend.tf
    │    ├── main.tf
    │    ├── provider.tf
    │    ├── variables.tf
    │    ├── terraform.tfvars
    │    ├── modules/
    │        ├── acm/
    │        ├── alb/
    │        ├── ecs/
    │        ├── route53/
    │        └── vpc/
    └── .github/workflows/
           ├── docker-build-push.yaml
           ├── terraform-apply.yaml
           ├── terraform-destroy.yaml
           └── terraform-plan.yaml
```

# 🚀 AWS Threat Composer Deployment via ECS & Terraform

## Project Overview
This project deploys the **Amazon Threat Composer Tool**, an open-source application for threat modeling and security assessment, onto **AWS ECS (Fargate)** using **Terraform**. The infrastructure is fully automated with modular Terraform code and deployed through **GitHub Actions** CI/CD pipelines. The solution provisions a secure and scalable architecture, including **VPC networking**, **Application Load Balancer with HTTPS via ACM**, **Route 53 DNS configuration**, and a container image hosted in **Amazon ECR**. With a single workflow, the application can be built, scanned for vulnerabilities, deployed, and made accessible via a custom domain over HTTPS.
## 🏗️ Architecture Diagram:

<p align="center">
  <img src="images/ecs.gif" alt="architechtural diagram" style="width:700px"/>
</p>


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
    │    └── modules/
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

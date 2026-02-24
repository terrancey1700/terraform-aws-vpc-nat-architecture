# Terraform AWS VPC with Public/Private Subnets and NAT Architecture

## Overview

This project provisions a production-style AWS VPC architecture using Terraform.

It demonstrates secure subnet isolation, route table–driven exposure control, outbound-only internet access via NAT Gateway, and bastion-based SSH access patterns. The infrastructure was built and validated end-to-end using Infrastructure as Code principles.

---

## Architecture

### VPC
- CIDR: 10.0.0.0/16
- DNS support and hostnames enabled

### Public Subnet
- CIDR: 10.0.1.0/24
- Route to Internet Gateway (0.0.0.0/0 → IGW)
- Public EC2 instance (bastion host)
- Public IP assignment enabled

### Private Subnet
- CIDR: 10.0.2.0/24
- No public IP assignment
- Route to NAT Gateway (0.0.0.0/0 → NAT)
- Outbound-only internet access

### Networking Components
- Internet Gateway (IGW)
- NAT Gateway with Elastic IP
- Dedicated public and private route tables
- Security group isolation between tiers

---

## Traffic Flow

**Inbound Access**

Laptop → Public EC2 (SSH)  
Public EC2 → Private EC2 (SSH over VPC internal routing)

**Outbound Access**

Private EC2 → NAT Gateway → Internet Gateway → Internet

The private subnet is not directly accessible from the public internet.

---

## Technologies Used

- Terraform
- AWS VPC
- EC2 (Amazon Linux 2023)
- Internet Gateway
- NAT Gateway
- Security Groups
- Remote S3 Backend

---

## Key Concepts Demonstrated

- Custom VPC design (no default VPC usage)
- Route table–based subnet exposure control
- NAT Gateway outbound-only routing model
- Bastion host access pattern
- Security group chaining between tiers
- SSH key generation managed via Terraform
- Infrastructure lifecycle discipline (`terraform apply` + `terraform destroy`)
- Cost-aware resource management

---

## Deployment

Initialize providers:
- `terraform init`

## Review the plan:
- `terraform plan`

## Destroy infrastructure (important to prevent NAT Gateway charges):
- `terraform destroy`

## Security Considerations
- SSH access restricted to a single public IP (/32)
- No public IPs assigned to private subnet instances
- No inbound internet access to private resources
- NAT Gateway used strictly for outbound traffic

## Future Enhancements
- Replace bastion SSH with AWS SSM Session Manager
- Introduce Application Load Balancer (ALB)
- Add private RDS tier
- Refactor into Terraform modules
- Implement CI/CD pipeline for Terraform
- Add state locking with DynamoDB

## Author

Terrance Young
DevOps / Cloud Engineering

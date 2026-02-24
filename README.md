# Terraform AWS VPC with Public/Private Subnets and NAT Architecture

## Overview

This project provisions a production-style AWS network architecture using Terraform.

The infrastructure demonstrates secure subnet isolation, controlled internet exposure, outbound-only routing via NAT Gateway, and bastion-based SSH access patterns.

The goal was to design and validate real-world VPC networking behavior while maintaining Infrastructure as Code discipline and clean teardown practices.

---

## Architecture Summary

### VPC
- CIDR: 10.0.0.0/16
- DNS support and hostnames enabled

### Public Subnet
- 10.0.1.0/24
- Route to Internet Gateway
- Bastion EC2 instance with public IP

### Private Subnet
- 10.0.2.0/24
- No public IP assignment
- Route to NAT Gateway
- Outbound-only internet access

### Networking Components
- Internet Gateway (IGW)
- NAT Gateway with Elastic IP
- Dedicated public and private route tables
- Security group isolation

---

## Traffic Flow

**Inbound Access Pattern**

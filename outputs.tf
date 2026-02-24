# Create a new file:
  - Run: touch outputs.tf
  - Then run: nano outputs.tf

########################################
# VPC Outputs
########################################

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

########################################
# Subnet Outputs
########################################

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}

########################################
# EC2 Outputs
########################################

output "public_instance_public_ip" {
  description = "Public IP of the bastion EC2 instance"
  value       = aws_instance.public.public_ip
}

output "private_instance_private_ip" {
  description = "Private IP of the internal EC2 instance"
  value       = aws_instance.private.private_ip
}

# After terraform apply, Terraform will print:
  - public_instance_public_ip = 18.222.xxx.xxx
  - private_instance_private_ip = 10.0.2.xx

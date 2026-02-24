variable "aws_region" {
  description = "AWS region to deploy infrastructure into"
  type        = string
  default     = "us-east-2"
}

# After adding region in providers, variable is needed to make sure:
  - Region is configurable
  - Clean separation
  - Environment-ready

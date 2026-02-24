terraform {
  backend "s3" {
    bucket         = "empowered-terraform-2"
    key            = "terraform-aws-vpc-nat-architecture/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}

## BUCKET must already exist. Don't just blindly copy
## Get your ACCESS KEY for the clone
## ENCRYPT = TRUE ensures server-side encryption in S3

- After adding BACKEND.TF, run: terraform init -reconfigure
  - Terraform will ask if you want to copy existing state to the new backend?
    - Answer: Yes

- After init, run: terraform state list
  - If it works, your state is successfully remote.

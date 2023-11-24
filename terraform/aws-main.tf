# Define the required providers and Terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

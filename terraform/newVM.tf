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

# Use an existing VPC
data "aws_vpc" "existing_vpc" {
  id = "vpc-08c1d7f48d153ad60"  # Replace with your VPC ID
}

# Use an existing subnet within the existing VPC
data "aws_subnet" "existing_subnet" {
  id = "subnet-02f6fe0f440577913"  # Replace with your subnet ID
}

# Create a security group for your EC2 instance
resource "aws_security_group" "instance_sg" {
  name        = "instance-sg"
  description = "Security group for the EC2 instance"
  vpc_id      = data.aws_vpc.existing_vpc.id

  # Define inbound and outbound rules as needed
  # Example: Allow SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add more rules as needed
}

# Launch an EC2 instance in the existing subnet
resource "aws_instance" "app_server" {
  count         = 2
  ami           = "ami-026ebd4cfe2c043b2"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.existing_subnet.id
  key_name      = "thangdv38-rsa256"  # Customize with your key pair name

  # Attach the security group to the instance
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  tags = {
    Name = "rhel9-instance-${count.index + 1}"
  }
}

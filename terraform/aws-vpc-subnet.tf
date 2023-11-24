# Use an existing VPC
data "aws_vpc" "existing_vpc" {
  id = "vpc-08c1d7f48d153ad60"  # Replace with your VPC ID
}

# Use an existing subnet within the existing VPC
data "aws_subnet" "existing_subnet" {
  id = "subnet-02f6fe0f440577913"  # Replace with your subnet ID
}

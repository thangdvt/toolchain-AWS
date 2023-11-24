# Create a security group for your EC2 instance
resource "aws_security_group" "instance_sg" {
  name        = "gitlab-install-toolchain"
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

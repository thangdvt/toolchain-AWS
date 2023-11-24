# Launch an EC2 instance in the existing subnet
resource "aws_instance" "app_server" {
  count         = 1
  ami           = "ami-026ebd4cfe2c043b2"
  instance_type = "t2.large"
  subnet_id     = data.aws_subnet.existing_subnet.id
  key_name      = "thangdv38-rsa256"  # Customize with your key pair name

  # Attach the security group to the instance
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  tags = {
    Name = "gitlab-install-toolchain-${count.index + 1}"
  }
}

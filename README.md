rhel 9 - install AWS
AMI-AWS: ami-026ebd4cfe2c043b2


terraform command

terraform apply -f ~/AWS-toolchain-install/terraform/main.tf

ansible command

ansible-playbook -i ~/AWS-toolchain-install/inventory.ini -u ec2-user -b --private-key /path/key.pem ~/AWS-toolchain-install/ansible/playbook.yaml

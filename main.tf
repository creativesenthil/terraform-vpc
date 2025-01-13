# Define the AWS provider
provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

# Define variables
variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
}

# Resource to create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (in us-east-1)
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "ExampleInstance"
  }
}

# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

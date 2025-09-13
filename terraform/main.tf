# Tell Terraform to use the AWS provider
provider "aws" {
  region = "ap-south-1" 
}

# Create a Security Group (Firewall) for our EC2 instance
resource "aws_security_group" "web_sg" {
  name        = "allow_web_traffic"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (for Ansible)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}

# Create an Elastic IP (your fixed public IP)
resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id

}

# Create the EC2 instance (your server)
resource "aws_instance" "web" {
  ami                    = "ami-0fc5d935ebf8bc3bc" # Ubuntu 22.04 LTS in us-east-1
  instance_type          = "t2.micro"              # Eligible for free tier
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = "devops-intern-project"

  tags = {
    Name = "Web-Server-Nepal"
  }
}

# Output the public IP address of the server after creation
output "public_ip" {
  description = "The public IP address of the web server"
  value       = aws_eip.web_eip.public_ip
}

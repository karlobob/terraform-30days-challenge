# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami                    = "ami-0ec10929233384c7f" # ami-0fb653ca2d3203ac1 (Amazon Linux 2 not available anymore)
  instance_type          = "t3.small"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data                   = <<-EOF
        #!/bin/bash
        echo "Hello, World" > index.html
        # converted to Amazon2023 which is httpd compatible
        nohup python3 -m http.server 8080 &
        EOF
  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

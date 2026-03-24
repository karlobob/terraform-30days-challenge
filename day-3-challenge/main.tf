# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.small"

  tags = {
    Name = "terraform-example"
  }
}
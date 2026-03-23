provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "instance1" {
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"

  tags = {
    name = "demo-ec2"
  }
}
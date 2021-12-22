provider "aws" {
    region = "aws-region"
    access_key = "aws-access-key"
    secret_key = "aws-secret-key"  
}

resource "aws_instance" "ec2instance" { // terraform resource name - custom resource name
  ami = "aws-ami-id" 
  instance_type = "t2.micro"
}
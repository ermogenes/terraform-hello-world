provider "aws" {
  region = "us-east-1"
  access_key = "xxxxxxxx"
  secret_key = "yyyyyyyy"
}

resource "aws_instance" "ec2_tf_hello-world" {
    ami = "ami-0022f774911c1d690" // Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
    instance_type = "t2.micro"

    tags = {
      Name = "terraform-hello-world"
    }
}
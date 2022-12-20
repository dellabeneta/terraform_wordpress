resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "wordpress_vpc"
  }
}

resource "aws_subnet" "subnet1" {
  availability_zone = "us-east-1a"
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    "Name" = "wordpress_subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  availability_zone = "us-east-1b"
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    "Name" = "wordpress_subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  availability_zone = "us-east-1c"
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    "Name" = "wordpress_subnet3"
  }
} 
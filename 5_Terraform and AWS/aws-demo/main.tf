
# Configure the AWS Provider
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  region                  = "us-east-1"
}

# Create VPC
resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"

}

# Create Public Subnet
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet"
  }
}


# Create First instance

resource "aws_instance" "web1" {
  ami           = "ami-09e67e426f25ce0d7" # Ubuntu 20.04 in us-east-1
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public1.id

  tags = {
    name = "webserver"
  }

}

# Create second instance
resource "aws_instance" "web2" {
  ami           = "ami-09e67e426f25ce0d7" # Ubuntu 20.04 in us-east-1
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public1.id

  tags = {
    name = "webserver"
  }

}




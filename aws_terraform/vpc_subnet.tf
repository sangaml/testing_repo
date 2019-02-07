#VPC creation- CIDR: 10.0.0.0/16
resource "aws_vpc" "terraVPC" {
  cidr_block = "10.0.0.0/16"

  #instance_tenancy="default"
  enable_dns_hostnames = "true"

  tags {
    Name = "TerraVPC"
  }
}

#Subnet creation- 4 subnets - 1 public and 2 private	
resource "aws_subnet" "terraPub1" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = "${aws_vpc.terraVPC.id}"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1a"

  tags {
    Name = "TerraPublic1"
  }
}

resource "aws_subnet" "terraPrv1" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = "${aws_vpc.terraVPC.id}"
  availability_zone = "ap-south-1a"

  tags {
    Name = "TerraPrivate1"
  }
}

resource "aws_subnet" "terraPrv2" {
  cidr_block        = "10.0.3.0/24"
  vpc_id            = "${aws_vpc.terraVPC.id}"
  availability_zone = "ap-south-1b"

  tags {
    Name = "TerraPrivate2"
  }
}

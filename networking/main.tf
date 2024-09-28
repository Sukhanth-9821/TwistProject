data "aws_vpc" "tp-vpc-cidr"{
    filter {
      name = "tag:Name"
      values = ["TwistProject-VPC01"]
    }
}

data "aws_subnet" "tp-snet01a-cidr"{
    filter {
      name = "tag:Name"
      values = ["TwistProject-pub-snet01a"]
    }
}

data "aws_subnet" "tp-snet01b-cidr"{
    filter {
      name = "tag:Name"
      values = ["TwistProject-pub-snet01b"]
    }
}

resource "aws_vpc" "tp-vpc" {
    cidr_block       = "${data.aws_vpc.tp-vpc-cidr.cidr_block}"
    instance_tenancy = "default"

    tags = {
    Name = "TwistProject-VPC01"
    }
}

resource "aws_subnet" "tp-snet01a" {
  vpc_id     = aws_vpc.tp-vpc.id
  cidr_block = "${data.aws_subnet.tp-snet01a-cidr.cidr_block}"
   tags = {
    Name = "TwistProject-pub-snet01a"
    }
}

resource "aws_subnet" "tp-snet01b" {
  vpc_id     = aws_vpc.tp-vpc.id
  cidr_block = "${data.aws_subnet.tp-snet01b-cidr.cidr_block}"
   tags = {
    Name = "TwistProject-pub-snet01b"
    }
}

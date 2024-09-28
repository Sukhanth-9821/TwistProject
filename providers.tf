terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
   backend "s3" {
    bucket         = "twistproject-21332534"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}

provider "aws"{
    alias = "NVirgi"
    region = "us-east-1"
}

provider "aws"{
    alias = "Mumbai"
    region = "ap-south-1"
}

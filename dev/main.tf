provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "my-cgit-icrew-s1"
    key     = "terraformdev.tfstate"
    region  = "us-east-1"
  }
}
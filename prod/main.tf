provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "my-cgit-icrew-s2"
    key     = "terraformprod.tfstate"
    region  = "us-east-2"
  }
}
terraform {
  backend "s3" {
    bucket  = "dellabeneta-wordpress-terraform"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
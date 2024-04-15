provider "aws" {
  region = "ap-south-1"
  profile = "projectmanagemnt"
}
terraform {
  backend "s3" {
    bucket = "projectmanagementstatebackend"
    region = "ap-south-1"
  }
}
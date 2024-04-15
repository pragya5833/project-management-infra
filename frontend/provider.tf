provider "aws" {
  region = "ap-south-1"
  profile = "projectmanagemnt"
}
terraform {
  backend "s3" {
    bucket = "projectmanagementstatefrontend"
    region = "ap-south-1"
  }
}
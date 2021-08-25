terraform {
  backend "s3" {
    bucket = "terraformstatefiledevelopment"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"

  }
}
terraform {
  backend "s3" {
    bucket = "terraformstatefiledevelopment"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    depends_on = [aws_s3_bucket.example.terraformstatefiledevelopmentaws]
  }
}


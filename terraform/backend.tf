terraform {
  backend "s3" {
    bucket = "java-bucket-1995"
    key    = "terraform/terraform.tfstate"
    region = "us-east-2"
  }
}

# To create bucket: aws s3api create-bucket --bucket java-bucket-1995 --region us-east-2 --create-bucket-configuration LocationConstraint=us-east-2
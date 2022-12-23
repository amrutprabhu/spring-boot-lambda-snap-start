terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

provider "aws" {
  profile = "personal"
  region = "eu-central-1"
}

module "lambda" {
  source = "modules/lambda"
}

#deploy API gateway
module "apiGateway" {
  source = "modules/ApiGateway"
  lambda_arn = "${module.lambda.lambda_arn}"
}
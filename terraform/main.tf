
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    backend "s3" {
    bucket         = "my-react-app-backend-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"  
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


module "api_gateway" {
  source      = "./modules/api_gateway"
  app_name    = var.app_name
  lambda_name = module.lambda.lambda_name
  lambda_arn  = module.lambda.lambda_arn
  cognito_user_pool_arn = module.cognito.user_pool_arn
  stage_name = var.stage_name
  region    = var.region
}

module "amplify" {
    source      = "./modules/amplify"
    app_name    = var.app_name
    github_repo  = var.github_repo
    github_token = var.github_token
    branch_name  = var.branch_name
    
    user_pool_id        = module.cognito.cognito_identity_pool_id
    user_pool_client_id = module.cognito.cognito_user_pool_client_id
    identity_pool_id    = module.cognito.cognito_identity_pool_id
    api_gateway_url     = module.api_gateway.api_url
  
}

module "cognito" {
    source = "./modules/cognito"
    app_name = var.app_name
    github_repo  = var.github_repo
    github_token = var.github_token
    branch_name  = var.branch_name
}

module "lambda" {
    source = "./modules/lambda"
    app_name = var.app_name
    
}
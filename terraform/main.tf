provider "aws" {
    region = "us-east-1"
  
}


module "api_gateway" {
  source      = "./modules/api_gateway"
  app_name    = module.amplify.app_name
  lambda_name = module.lambda.lambda_name
  lambda_arn  = module.lambda.lambda_arn
  cognito_user_pool_arn = module.cognito.user_pool_arn
}
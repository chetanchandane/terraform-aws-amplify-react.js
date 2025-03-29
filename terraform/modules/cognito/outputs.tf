output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}

output "cognito_user_pool_client_id" {
  value = aws_cognito_user_pool_client.user_pool_client.id
}

output "cognito_identity_pool_id" {
  value = aws_cognito_identity_pool.identity_pool.id
}

output "user_pool_arn" {
  value = aws_cognito_user_pool.user_pool.arn
  
}

output "demo_user_credentials" {
  description = "Demo Cognito user credentials"
  value = {
    username = aws_cognito_user.demo_user.username
    password = "TestPassword123!"
    email    = aws_cognito_user.demo_user.attributes["email"]
  }
}
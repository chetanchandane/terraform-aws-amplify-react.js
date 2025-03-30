output "amplify_app_url" {
  description = "URL of the hosted Amplify frontend app"
  value       = "https://${module.amplify.default_domain}/${var.branch_name}"
}

# cognito

output "cognito_user_pool_id" {
  value = module.cognito.user_pool_id
}

output "cognito_user_pool_client_id" {
  value = module.cognito.user_pool_client_id
}

output "identity_pool_id" {
  value = module.cognito.identity_pool_id
}

# API Endpoint
output "api_gateway_url" {
  description = "Invoke URL for API Gateway"
  value       = module.api_gateway.api_url
}


#demo user
output "demo_user_info" {
  value = module.cognito.demo_user_credentials
  sensitive = true
}

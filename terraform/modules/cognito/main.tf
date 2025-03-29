
resource "aws_cognito_user_pool" "user_pool" {
  name = "${var.app_name}-user-pool"
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name         = "${var.app_name}-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  generate_secret = false
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows = ["code", "implicit"]
  allowed_oauth_scopes = [
  "email", 
  "openid", 
  "aws.cognito.signin.user.admin"]
  callback_urls = ["https://example.com/callback"]
  logout_urls   = ["https://example.com/logout"]
}

resource "aws_cognito_identity_pool" "identity_pool" {
  identity_pool_name               = "${var.app_name}-identity-pool"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id         = aws_cognito_user_pool_client.user_pool_client.id
    provider_name     = aws_cognito_user_pool.user_pool.endpoint
    server_side_token_check = false
  }
}

resource "aws_cognito_user" "demo_user" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  username     = "testuser"

  attributes = {
    email          = "testuser@example.com"
    email_verified = "true"
  }

  temporary_password     = "TestPassword123!"
  message_action         = "SUPPRESS"
  force_alias_creation   = false
}


locals {
  amplify_env_vars = {
    REACT_APP_USER_POOL_ID         = var.user_pool_id
    REACT_APP_USER_POOL_CLIENT_ID  = var.user_pool_client_id
    REACT_APP_IDENTITY_POOL_ID     = var.identity_pool_id
    REACT_APP_API_BASE_URL         = var.api_gateway_url
  }
}


resource "aws_iam_role" "amplify_service_role" {
  name = "amplify-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "amplify.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "amplify_attach" {
  role       = aws_iam_role.amplify_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-Amplify"
}

resource "aws_amplify_app" "app" {
  name         = var.app_name
  repository   = var.github_repo
  oauth_token  = var.github_token
  access_token = var.github_token
  platform     = "WEB"

  iam_service_role_arn = aws_iam_role.amplify_service_role.arn

  build_spec = <<EOT
version: 1.0
frontend:
  phases:
    preBuild:
      commands:
        - cd frontend
        - npm ci
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: frontend/build
    files:
      - '**/*'
  cache:
    paths:
      - frontend/node_modules/**/*
EOT

  environment_variables = local.amplify_env_vars
}

resource "aws_amplify_branch" "main" {
  app_id           = aws_amplify_app.app.id
  branch_name      = var.branch_name
  enable_auto_build = true
  environment_variables = local.amplify_env_vars
}


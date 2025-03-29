variable "app_name" {
  description = "The name of the application"
  type        = string
  default = "my_app"
  
}

variable "github_repo" {
    type = string
    description = "The GitHub repository URL"
    default = "https://github.com/chetanchandane/terraform-aws-amplify-react.js"
}

variable "branch_name" {
    type = string
    description = "The branch name to deploy"
    default = "main"
}

variable "github_token" {
    type = string
    description = "The GitHub token for authentication"
}
variable "stage_name" {
    type = string
    description = "The stage name for the API Gateway"
    default = "dev"
  
}


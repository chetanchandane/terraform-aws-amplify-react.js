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
    default = "value"
  
}
variable "stage_name" {
    type = string
    description = "The stage name for the API Gateway"
    default = "dev"
  
}

variable "backend_bucket" {
    type = string
    description = "The S3 bucket for the backend"
    default = "your-backend-bucket"
}
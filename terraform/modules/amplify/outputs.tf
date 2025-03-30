output "amplify_console_url" {
  value = "https://${aws_amplify_app.app.default_domain}/${var.branch_name}"
}

output "app_name" {
  value = aws_amplify_app.app.name  
}

output "default_domain" {
  value = aws_amplify_app.app.default_domain
}

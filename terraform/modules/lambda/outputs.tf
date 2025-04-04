output "lambda_arn" {
    description = "Lambda ARN"
    value = aws_lambda_function.hello_world.invoke_arn
}

output "lambda_name" {
    description = "Lambda Name"
    value = aws_lambda_function.hello_world.function_name
}

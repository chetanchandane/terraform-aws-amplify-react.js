output "lambda_arn" {
    value = aws_lambda_function.hello_world.arn
}

output "lambda_name" {
    value = aws_lambda_function.hello_world.function_name
}

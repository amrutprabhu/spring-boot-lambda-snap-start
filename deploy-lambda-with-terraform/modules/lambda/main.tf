resource "aws_iam_role" "lambda_iam_role" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "spring_boot_lambda" {
  function_name = "spring_boot_function"
  role          = aws_iam_role.lambda_iam_role.arn
  handler       = "org.springframework.cloud.function.adapter.aws.FunctionInvoker::handleRequest"
  memory_size   = 512
  s3_bucket     = "amrut-test-123"
  s3_key        = "empty.zip"
  runtime       = "java11"
  package_type  = "Zip"
  timeout       = 15
  snap_start {
    apply_on    = "PublishedVersions"
  }

}

output "lambda_arn" {
  value = aws_lambda_function.spring_boot_lambda.arn
}
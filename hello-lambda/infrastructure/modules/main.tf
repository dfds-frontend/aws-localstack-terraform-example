terraform {
  required_version = "~> 0.15.4"
}

// resource "null_resource" "ls" {
//   provisioner "local-exec" {
//     command = "ls -al"
//     interpreter = ["bash", "-c"]
//   }
// }

data "archive_file" "lambdazip" {
  type             = "zip"
  source_file      = "/project/hello-lambda/index.js"
  output_path      = "/project/hello-lambda/dist/index.zip"
}

variable "LOCAL_LAMBDA_CODE_PATH" {
  type             = string
  default          = ""
}

resource "aws_lambda_function" "hello" {
  function_name    = "hello"
  filename         = length(var.LOCAL_LAMBDA_CODE_PATH) == 0 ? "/project/hello-lambda/dist/index.zip" : null
  s3_bucket        = length(var.LOCAL_LAMBDA_CODE_PATH) == 0 ? null : "__local__"
  s3_key           = length(var.LOCAL_LAMBDA_CODE_PATH) == 0 ? null : var.LOCAL_LAMBDA_CODE_PATH
  role             = "whatever"
  handler          = "index.hello"
  runtime          = "nodejs12.x"
}

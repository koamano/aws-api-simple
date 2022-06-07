provider "aws" {
    profile = "default"
    region = "us-east-2"
}

resource "aws_lambda_function" "sample-lambda-tf" {
  function_name = "sample-lambda-tf"
  description   = "cloudformation sample lambda"
  s3_bucket   = "koamano-s3"
  s3_key      = "lambda.zip" # its mean its depended on upload key
  memory_size = 128
  timeout     = 30
  runtime          = "dotnet6"
  role             = "${aws_iam_role.terraform_function_role.arn}"
  handler          = "aws-api-simple::aws_api_simple.Function::FunctionHandler"

}

data "aws_iam_policy_document" "AWSLambdaTrustPolicy" {
  statement {
    actions    = ["sts:AssumeRole"]
    effect     = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "terraform_function_role" {
  name               = "terraform_function_role"
  assume_role_policy = "${data.aws_iam_policy_document.AWSLambdaTrustPolicy.json}"
}

resource "aws_iam_role_policy_attachment" "terraform_lambda_policy" {
  role       = "${aws_iam_role.terraform_function_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

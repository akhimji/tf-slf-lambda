resource "aws_lambda_function" "python-lambda-function" {
    function_name = "slf-tf-lambda"
    description   = "lambda function from ECR via terraform"
    image_uri     = "460769507119.dkr.ecr.ca-central-1.amazonaws.com/slfdemo:v2"
    package_type  = "Image"
    architectures = ["x86_64"]
    role          = aws_iam_role.slf_lambda_role.arn
    }
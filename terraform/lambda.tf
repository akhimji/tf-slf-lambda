

data "aws_vpc" "selected" {
    id = "vpc-0a2161573a3b97323"
}

data "aws_subnet_ids" "selected" {
    vpc_id = data.aws_vpc.selected.id
}

data "aws_security_group" "selected" {
    vpc_id = data.aws_vpc.selected.id
    name   = "default"

}

data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = "../app/demo.py"
    output_path   = "lambda_function.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename         = "lambda_function.zip"
  function_name    = "test_lambda"
  role              = aws_iam_role.slf_lambda_role.arn
  handler          = "demo.lambda_handler"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  runtime          = "python3.8"
  vpc_config {
    subnet_ids         = data.aws_subnet_ids.selected.ids
    security_group_ids = [data.aws_security_group.selected.id]
  }  
   environment {
    variables = {
      VPC_ID = "${data.aws_vpc.selected.id}"
      SUBNET_IDS =  join(",", "${data.aws_subnet_ids.selected.ids}")
      SG = "${data.aws_security_group.selected.id}"

    }
  }
}



# resource "aws_lambda_function" "python-lambda-function" {
#     function_name = "slf-tf-lambda"
#     description   = "lambda function from ECR via terraform"
#     image_uri     = "460769507119.dkr.ecr.ca-central-1.amazonaws.com/slfdemo:v4"
#     package_type  = "Image"
#     architectures = ["x86_64"]
#     role          = aws_iam_role.slf_lambda_role.arn
#     }
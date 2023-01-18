resource "aws_iam_role" "slf_lambda_role" {

    name               = "slf_lambda_role"
    assume_role_policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
            {
            "Action": "sts:AssumeRole",
            "Principal": {
            "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow"
            }
        ]
    }
    )
}
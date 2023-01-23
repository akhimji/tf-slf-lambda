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

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment_lambda_vpc_access_execution" {
  role       = aws_iam_role.slf_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}
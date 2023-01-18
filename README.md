# tf-slf-lambda

### Build
```
docker build -t slfdemo:v1 .
```

### Tag 
```
docker tag slfdemo:v1 460769507119.dkr.ecr.ca-central-1.amazonaws.com/slfdemo:v1
```

### Push

```
docker push 460769507119.dkr.ecr.ca-central-1.amazonaws.com/slfdemo:latest
```

### Terraform

```
cd ../terraform/
```

### Update lambda.tf
```
image_uri     = "460769507119.dkr.ecr.ca-central-1.amazonaws.com/slfdemo:v1"
```


### Init, Plan, Apply
```
terraform init
terraform plan
terraform apply

erraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_lambda_function.python-lambda-function will be updated in-place
  ~ resource "aws_lambda_function" "python-lambda-function" {
        id                             = "slf-tf-lambda"
      ~ image_uri                      = "460769507119.dkr.ecr.ca-central-1.amazonaws.com/slfdemo:latest" -> "460769507119.dkr.ecr.ca-central-1.amazonaws.com/slfdemo:v1"
      ~ last_modified                  = "2023-01-18T18:53:29.572+0000" -> (known after apply)
        tags                           = {}
        # (17 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_lambda_function.python-lambda-function: Modifying... [id=slf-tf-lambda]
aws_lambda_function.python-lambda-function: Still modifying... [id=slf-tf-lambda, 10s elapsed]
aws_lambda_function.python-lambda-function: Still modifying... [id=slf-tf-lambda, 20s elapsed]
aws_lambda_function.python-lambda-function: Modifications complete after 30s [id=slf-tf-lambda]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```

# AWS, localstack, terraform, lambda example
This project contains an example of how to utilize `localstack` and `terraform`(with terragrunt) to run an `aws` lambda function locally.

## Getting started
Run `docker-compose -f ./docker-compose.yaml up` from the root of the project.

## Check if localstack is running
Browse to the following url `http://localhost:4566/health` and you should be able to inspect which services is currently started in `localstack`

## Invoking the `hello` lambda
Ensure that you have the aws cli installed first and then run the following command.

```bash
aws --region eu-central-1 --endpoint-url=http://localhost:4566 lambda invoke --function hello --payload '{}' output.json
```

## Hot-swap 
Follow in instructions in the `.env` file in order to pull the lambda function code from the local directory.
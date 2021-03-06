# AWS, localstack, terraform, lambda example
This project contains an example of how to utilize `localstack` and `terraform`(with terragrunt) to run an `aws` lambda function locally.

## Getting started
Run `docker-compose -f ./docker-compose.yaml up` from the root of the project.

## Check if localstack is running
Browse to the following url `http://localhost:4566/health` and you should be able to inspect which services are currently started in `localstack`

## Invoking the `hello` lambda

Using curl:

```bash
curl -X POST http://localhost:4566/2015-03-31/functions/hello/invocations
```

Using aws cli:

```bash
aws --region eu-central-1 --endpoint-url=http://localhost:4566 lambda invoke --function hello --payload '{}' output.json
```

## Hot-swap 
Follow in instructions in the `.env.example` file in order to pull the lambda function code from the local directory.

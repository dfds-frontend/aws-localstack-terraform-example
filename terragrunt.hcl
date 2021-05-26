# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "./hello-lambda/infrastructure/modules"
}

inputs = {
  env = "local"
}

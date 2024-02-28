## Terraform
Terraform resource definitions to provision the following resources on IBM Cloud:

1. ibm_resource_group
2. ibm_code_engine_project
3. ibm_code_engine_app

The Terraform code in this directory is used by Schematics during GitHub Actions job defined in the [CI pipeline](../.github/workflows/main.yml). Schematics will fetch the latest code version and run a plan job based on the latest Terraform code updates.

## Local development

To run the code locally:
```bash
export IC_API_KEY=aBcDeFgHiJklMnoPqRsTuVwXyZ
terraform init
terraform plan
terraform apply
```

To destroy the infra:
```bash
terraform destroy
```
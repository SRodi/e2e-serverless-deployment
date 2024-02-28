## End to End Serverless Deployment
This repo contains all code required to deploy a Go Serverless application with [IBM Cloud Code Engine](https://www.ibm.com/products/code-engine)

### Features

1. Code example for a simple HTTP web server
2. Configuration to create a container image
3. [Terraform](https://developer.hashicorp.com/terraform) Infrastructure as Code (IaC) to create a serverless deployment with [IBM Cloud Code Engine](https://www.ibm.com/products/code-engine)
4. Continuous Integration (CI) with [GitHub action](https://docs.github.com/en/actions)
3. Terraform runtime and state management with [IBM Cloud Schematics](https://www.ibm.com/products/schematics)


## Quick Start

Each subdirectory contains its own README.md to provide info about the implementation, requirements and instructions for each project component.

### Directories:

* [go/](./go/README.md): Source code for go application
* [docker/](./docker/README.md): Dockerfile to create Docker image for go application
* [schematics/](./schematics/README.md): Scripts to interact with IBM Cloud Schematics
* [terraform/](./terraform/README.md): Terraform project with definition files to create IBM Cloud Code Engine serverless project and app via IaC


### Prerequisites:

1. Access to an IBM Cloud account
2. DockerHub account
3. GitHub account

### High level steps:

1. Fork this repo
2. Configure Secrets in GitHub repo settings (see [.github/workflows/README.md](./.github/workflows/README.md))
3. Create a Schematics workspace based on your repo (see [schematics/README.md](./schematics/README.md))
4. Replace this URL with your repo URL https://github.com/SRodi/e2e-serverless-deployment/blob/61b589833bf59099f584f662da3d9c8790dbed0f/schematics/config.json#L17
4. (Optional) Update the Docker image name to reference your own image https://github.com/SRodi/e2e-serverless-deployment/blob/810a49b94e519434b3d08d299d6ceb1bc1b5a6fe/terraform/main.tf#L3

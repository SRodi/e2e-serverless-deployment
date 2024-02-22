## End to End Serverless Deployment
This repo contains all code required to deploy a Go Serverless application with [IBM Cloud Code Engine](https://www.ibm.com/products/code-engine)


## Prerequisites

1. Create a DockerHub access token https://docs.docker.com/security/for-developers/access-tokens/#create-an-access-token
2. Create `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` secrets in your GitHub repository https://docs.docker.com/build/ci/github-actions/#step-one-create-the-repository
3. Create `IBM_CLOUD_API_KEY` secret in your GitHub repository  
4. Export the env variable `IC_API_KEY` on your terminal and run [./schematics/create-workspace.sh](./schematics/create-workspace.sh)


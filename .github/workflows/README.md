# GitHub Actions workflow
File [main.yml](main.yml) contains the Continuous Integration pipeline configuration to:

1. checkout the repo
2. build and push docker image to Docker HUB
3. install IBM Cloud CLI
4. update Schematics workspace
5. run Schematics plan job

## Prerequisites

1. Create a DockerHub access token [see Docker docs: Create an access token](https://docs.docker.com/security/for-developers/access-tokens/#create-an-access-token)
2. Create `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` secrets in your GitHub repository [see Docker docs: Get started with GitHub Actions](https://docs.docker.com/build/ci/github-actions/#step-one-create-the-repository)
3. Create `IBM_CLOUD_API_KEY` secret in your GitHub repository
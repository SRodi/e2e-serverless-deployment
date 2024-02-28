## Schematics
This directory contains 2 scripts

1. [create-workspace](create-workspace.sh)
2. [ops.sh](ops.sh)

### create-workspace.sh
This scripts simply creates an IBM Cloud Schematics workspace

```bash
export IC_API_KEY=aBcDeFgHiJklMnoPqRsTuVwXyZ
./create-workspace
```

### ops.sh
This scripts provides a set of functions to interact with IBM Cloud Schematics, specifically:

1. get workspace status
2. get job status
3. workspace update
4. schematics plan job

This script is used by GitHub Action for Continuous Integration (CI) pipeline, however, it can be useful during development to interact with Schematics from your local machine.

Prior to running the script locally, login to IBM Cloud `ibmcloud login --apikey $IC_API_KEY -r eu-de`

To update Schematics workspace:
```bash
./ws_update
```

To run a Schematics plan job:
```bash
./plan
```
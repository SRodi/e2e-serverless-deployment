## docker
Dockerfile for sample [go_http.go](../go/go_http.go) HTTP web server. This Dockerfile uses a multi-stage build for readability and to maintain a small image size (6.72MB). See [Docker docs: Multi-stage builds](https://docs.docker.com/build/building/multi-stage/) for further info.

To build your image locally:
```bash
# from the root directory of the project (i.e. "cd .." from here)
docker build . -f docker/Dockerfile -t my-local-test:0.0.1
```

To run your container locally:
```bash
docker run -p 8080:8080 my-local-test:0.0.1
```

Send a request to your server running in the Docker container locally:
```bash
curl localhost:8080
# Response should be:
# Here is a simple web-server!% 
```
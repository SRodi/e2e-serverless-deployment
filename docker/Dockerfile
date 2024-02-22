# Specifies a parent image
FROM golang:1.21.7-bullseye AS build-stage
 
WORKDIR /app
COPY ./go/go.mod ./
RUN go mod download
COPY ./go/*.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /go_http


# Create a new release build stage
FROM gcr.io/distroless/base-debian11 AS build-release-stage
# Set the working directory to the root directory path
WORKDIR /
# Copy over the binary built from the previous stage
COPY --from=build-stage /go_http /go_http
EXPOSE 8080
ENTRYPOINT ["/go_http"]
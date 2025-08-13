# Start from the official Golang image
FROM golang:latest

# Install protoc
RUN apt-get update && apt-get install -y protobuf-compiler

# Install Go protoc plugins
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest \
    && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Set a default working directory
WORKDIR /go/src/app

# Set environment variables for Go
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Keep container alive by default (override when running commands)
CMD ["bash"]

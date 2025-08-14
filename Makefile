# Extract module name from go.mod
GO_MODULE := $(shell grep '^module ' go.mod | sed 's/^module //')

.PHONY: gen protoc-gen clean check-deps run build test install-deps

# Check if protoc and Golang plugins are installed
check-deps:
	@which protoc > /dev/null || (echo "protoc not found. Please install Protocol Buffers compiler" && exit 1)
	@which protoc-gen-go > /dev/null || (echo "protoc-gen-go not found. Run: go install google.golang.org/protobuf/cmd/protoc-gen-go@latest" && exit 1)
	@which protoc-gen-go-grpc > /dev/null || (echo "protoc-gen-go-grpc not found. Run: go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest" && exit 1)

# Install protoc plugins for Golang
install-deps:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

protoc-gen:
	@echo "🔄 Generating Go code from proto files..."
	@find proto -name "*.proto" -exec protoc \
		--go_out=. --go_opt=module=${GO_MODULE} \
		--go-grpc_out=.  --go-grpc_opt=module=${GO_MODULE} \
		{} \;
	@echo "✅ Proto files generated successfully"

gen: check-deps protoc-gen
	@echo "✅ Code generation finished"

clean:
	@echo "🧹 Cleaning generated files..."
	rm -rf ./generated
	@echo "✅ Cleaned generated files"

# Development helpers
run:
	go run main.go

# Show help
help:
	@echo "Available targets:"
	@echo "  install-deps  - Install protoc plugins"
	@echo "  gen          - Generate Go code from proto files"
	@echo "  clean        - Clean generated files"
	@echo "  run          - Run the application"
	@echo "  build        - Build the application"
	@echo "  help         - Show this help message"

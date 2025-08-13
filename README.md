# lab-go-protoc-config

This repository showcases how to configure and run protoc to produce Go code from Protocol Buffer definitions.

## Try out

- Click [here](./docker-lab-env/Dockerfile) to view a Dockerfile containing the development environment for this project.
- The following codelab has been tested using Docker 27.4.0.

### Codelab

1. Build the docker enviroment image:

        docker build -t labenv ./docker-lab-env

1. Run `labenv` container, attach the project dir and get a bash:

        docker run --rm -it -v $(pwd):/go/src/app -w /go/src/app labenv bash

1. From the `labenv` container's bash, generate the golang code:

        make gen
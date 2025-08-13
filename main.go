package main

import (
	"fmt"
	"log"

	v1 "github.com/alcastic/lab-go-protoc-config/generated/generated/proto/api/v1"
	"google.golang.org/protobuf/encoding/protojson"
)

func main() {
	hello := v1.Hello{
		Name: "World",
	}

	json, err := protojson.Marshal(&hello)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(string(json))
}

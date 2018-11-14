package main

import (
	"fmt"
	"race-history-3/libs"
)

var config = libs.ReadConfig()

func main() {

	fmt.Printf("HttpHost: %s!\n", config.GetHttpServerUrl())
}

package main

import (
	"race-history-3/libs"
	"race-history-3/pages"
)

var Config libs.AppConfig

func main() {

	Config = libs.ReadConfig()

	pages.Init(Config)
}

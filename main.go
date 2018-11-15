package main

import (
	"race-history-3/libs"
	"race-history-3/pages"
)

var ApplicationConfig libs.AppConfig

func main() {

	ApplicationConfig = libs.ReadConfig()

	pages.Init(ApplicationConfig)
}

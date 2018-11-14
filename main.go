package main

import "C"
import (
	"github.com/gin-gonic/gin"
	"race-history-3/libs"
)

var Config libs.AppConfig

func main() {

	Config = libs.ReadConfig()
	start()
}

func start() {

	r := gin.Default()

	r.GET("/ping", pong)

	err := r.Run(Config.GetHttpServerUrl())

	if err != nil {
		panic(err.Error())
	}
}

func pong(c *gin.Context) {

	c.JSON(200, gin.H{
		"message": "pong!",
	})
}

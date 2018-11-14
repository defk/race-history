package main

import (
	"github.com/gin-gonic/gin"
	"race-history-3/libs"
)

var config = libs.ReadConfig()

func main() {

	start()
}

func start() {

	r := gin.Default()

	r.GET("/ping", pong)

	err := r.Run(config.GetHttpServerUrl())

	if err != nil {
		panic(err.Error())
	}
}

func pong(c *gin.Context) {

	c.JSON(200, gin.H{
		"message": "pong!",
	})
}

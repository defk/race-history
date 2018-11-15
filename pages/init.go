package pages

import (
	"github.com/gin-gonic/gin"
	"race-history-3/libs"
)

var ApplicationConfig libs.AppConfig

func Init(Config libs.AppConfig) {

	ApplicationConfig = Config

	r := gin.Default()

	r.GET("/ping", Ping)
	r.GET("/championships", Championships)
	r.GET("/championship/:id", Championship)

	err := r.Run(ApplicationConfig.GetHttpServerUrl())

	if err != nil {
		panic(err.Error())
	}
}

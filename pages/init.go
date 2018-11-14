package pages

import (
	"github.com/gin-gonic/gin"
	"race-history-3/libs"
)

var Conf libs.AppConfig

func Init(Config libs.AppConfig) {

	Conf = Config

	r := gin.Default()

	r.GET("/ping", Ping)

	err := r.Run(Conf.GetHttpServerUrl())

	if err != nil {
		panic(err.Error())
	}
}

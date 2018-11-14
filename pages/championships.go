package pages

import "github.com/gin-gonic/gin"

func Championships(c *gin.Context) {

	c.JSON(501, gin.H{
		"alias": "NotImplemented",
		"text":  "Приходите завтра;)",
	})
}

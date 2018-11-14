package libs

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
)

func (config *config) GetHttpServerUrl() string {

	return fmt.Sprintf("%s:%d",
		config.Servers.Http.Host,
		config.Servers.Http.Port)
}

func ReadConfig() config {

	conf := config{}
	data, err := ioutil.ReadFile("env.json")

	if err != nil {

		panic(err.Error())
	}

	err = json.Unmarshal(data, &conf)

	if err != nil {

		panic(err.Error())
	}

	return conf
}

type config struct {
	Servers struct {
		Http struct {
			Host string `json:"host"`
			Port int    `json:"port"`
		} `json:"http"`
		Websocket struct {
			Host string `json:"host"`
			Port int    `json:"port"`
		} `json:"websocket"`
	} `json:"servers"`
	Database struct {
		Postgres struct {
			Host string `json:"host"`
			Port int    `json:"port"`
			User string `json:"user"`
			Pass string `json:"pass"`
			Base string `json:"base"`
		} `json:"postgres"`
	} `json:"database"`
}

package libs

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
)

type AppConfig interface {
	GetHttpServerUrl() string
}

func (c Config) GetHttpServerUrl() string {

	return fmt.Sprintf("%s:%d",
		c.Servers.Http.Host,
		c.Servers.Http.Port)
}

func ReadConfig() Config {

	config := Config{}
	data, err := ioutil.ReadFile("env.json")

	if err != nil {

		panic(err.Error())
	}

	err = json.Unmarshal(data, &config)

	if err != nil {

		panic(err.Error())
	}

	return config
}

type Config struct {
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

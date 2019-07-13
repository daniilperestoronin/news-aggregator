package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {

	apiKey := os.Args[1]

	router := gin.Default()

	router.Use(cors.Default())

	router.GET("/", func(context *gin.Context) {

		sources := context.Query("sources")

		response, err := http.Get("https://newsapi.org/v2/top-headlines?sources=" + sources + "&apiKey=" + apiKey)

		if err != nil {
			fmt.Print(err.Error())
			os.Exit(1)
		}

		responseData, err := ioutil.ReadAll(response.Body)
		if err != nil {
			log.Fatal(err)
		}

		context.Header("Content-Type", "application/json; charset=utf-8")
		context.String(200, string(responseData))
	})
	router.Run(":8082")
}

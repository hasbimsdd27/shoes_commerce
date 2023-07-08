package main

import (
	"fmt"
	"server/auth"
	"server/handler"
	"server/helpers"
	"server/libs"
	"server/user"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.Use(cors.Default())
	api := router.Group("/api/v1")

	db := libs.ConnectDB()

	userRepository := user.NewRepository(db)

	authService := auth.NewService()
	userService := user.NewService(userRepository)

	userHandler := handler.NewUserHandler(userService, authService)

	api.GET("/", func(ctx *gin.Context) {

		ctx.JSON(200, gin.H{
			"status":  "success",
			"message": "hello",
		})
	})

	api.POST("/auth/login", userHandler.LoginUser)
	api.POST("/auth/register", userHandler.RegisterUser)

	router.Run(fmt.Sprintf("127.0.0.1:%s", helpers.GetEnv("PORT")))
}

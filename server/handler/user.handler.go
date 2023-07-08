package handler

import (
	"net/http"
	"server/auth"
	"server/helpers"
	"server/user"

	"github.com/gin-gonic/gin"
)

type userHandler struct {
	userService user.Service
	authService auth.Service
}

func NewUserHandler(userService user.Service, authService auth.Service) *userHandler {
	return &userHandler{userService, authService}
}

func (h *userHandler) RegisterUser(c *gin.Context) {
	var input user.RegisterUserInput

	err := c.ShouldBindJSON(&input)

	if err != nil {
		errors := helpers.FormatValidationError(err)

		errorMessage := gin.H{
			"errors": errors,
		}

		response := helpers.APIResponse("Register failed", false, errorMessage)

		c.JSON(http.StatusBadRequest, response)
		return
	}

	newUser, err := h.userService.RegisterUser(input)

	if err != nil {

		errorMessage := gin.H{
			"errors": err.Error(),
		}

		response := helpers.APIResponse("register failed", false, errorMessage)

		c.JSON(http.StatusBadRequest, response)
		return
	}

	token, err := h.authService.GenerateToken(newUser.ID)

	if err != nil {

		errorMessage := gin.H{
			"errors": err.Error(),
		}

		response := helpers.APIResponse("register failed", false, errorMessage)

		c.JSON(http.StatusBadRequest, response)
		return
	}

	response := helpers.APIResponse("registered Successfully", true, user.FormatUser(newUser, token))

	c.JSON(http.StatusOK, response)

}

func (h *userHandler) LoginUser(c *gin.Context) {
	var input user.LoginInput

	err := c.ShouldBind(&input)

	if err != nil {
		errors := helpers.FormatValidationError(err)

		errorMessage := gin.H{
			"errors": errors,
		}

		response := helpers.APIResponse("login failed", false, errorMessage)

		c.JSON(http.StatusBadRequest, response)
		return
	}

	loggedInUser, err := h.userService.Login(input)

	if err != nil {

		errorMessage := gin.H{
			"errors": err.Error(),
		}

		response := helpers.APIResponse("login failed", false, errorMessage)

		c.JSON(http.StatusBadRequest, response)
		return
	}

	token, err := h.authService.GenerateToken(loggedInUser.ID)

	if err != nil {

		errorMessage := gin.H{
			"errors": err.Error(),
		}

		response := helpers.APIResponse("login failed", false, errorMessage)

		c.JSON(http.StatusBadRequest, response)
		return
	}

	response := helpers.APIResponse("login Successfully", true, user.FormatUser(loggedInUser, token))

	c.JSON(http.StatusOK, response)

}

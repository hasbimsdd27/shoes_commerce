package helpers

import "github.com/go-playground/validator/v10"

type Response struct {
	Status  bool        `json:"status"`
	Message string      `json:"message"`
	Data    interface{} `json:"Data"`
}

func FormatValidationError(err error) []string {
	var errors []string

	for _, e := range err.(validator.ValidationErrors) {
		errors = append(errors, e.Error())
	}

	return errors
}

func APIResponse(message string, status bool, data interface{}) Response {
	return Response{
		Message: message,
		Status:  status,
		Data:    data,
	}
}

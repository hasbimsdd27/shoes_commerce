package user

type UserFormatter struct {
	ID       int    `json:"id"`
	Email    string `json:"email"`
	Fullname string `json:"fullname"`
	Token    string `json:"token"`
	Role     string `json:"role"`
}

func FormatUser(user User, token string) UserFormatter {
	formatter := UserFormatter{
		ID:       user.ID,
		Fullname: user.Fullname,
		Email:    user.Email,
		Token:    token,
		Role:     user.Role,
	}

	return formatter
}

package user

import "time"

type User struct {
	ID          int
	Fullname    string
	Email       string
	Password    string
	Role        string
	PhoneNumber string
	CreatedAt   time.Time
	UpdatedAt   time.Time
	IsDeleted   int
}

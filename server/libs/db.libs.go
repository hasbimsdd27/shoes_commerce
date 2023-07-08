package libs

import (
	"fmt"
	"log"
	"server/helpers"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func ConnectDB() *gorm.DB {

	dbUser := helpers.GetEnv("DB_USER")
	dbPass := helpers.GetEnv("DB_PASS")
	dbHost := helpers.GetEnv("DB_HOST")
	dbName := helpers.GetEnv("DB_NAME")
	dbPort := helpers.GetEnv("DB_PORT")

	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local", dbUser, dbPass, dbHost, dbPort, dbName)
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})

	if err != nil {
		log.Fatal(err.Error())
	}

	return db
}

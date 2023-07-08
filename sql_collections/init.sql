CREATE DATABASE IF NOT EXISTS `db_shoes_commerce`;

CREATE TABLE IF NOT EXISTS `db_shoes_commerce`.`users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `fullname` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `role` VARCHAR(10) NOT NULL,
    `phone_number` VARCHAR(20) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NULL,
    `is_deleted` TINYINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`email`),
    UNIQUE (`phone_number`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `db_shoes_commerce`.`product_catrgories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NULL,
    `is_deleted` TINYINT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `db_shoes_commerce`.`products` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `price` FLOAT NOT NULL,
    `description` TEXT NULL,
    `tags` VARCHAR(100) NULL,
    `category_id` BIGINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NULL,
    `is_deleted` TINYINT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`category_id`) REFERENCES `product_catrgories`(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `db_shoes_commerce`.`product_galleries` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_id` BIGINT NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NULL,
    `is_deleted` TINYINT NULL,
    `is_primary` TINYINT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `db_shoes_commerce`.`transactions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `address` TEXT NOT NULL,
    `total_price` FLOAT NOT NULL,
    `shipping_price` FLOAT NOT NULL,
    `status` VARCHAR(10) NOT NULL,
    `payment` VARCHAR(10) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NULL,
    `is_deleted` TINYINT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `db_shoes_commerce`.`transaction_details` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `transaction_id` BIGINT NOT NULL,
    `qty` BIGINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NULL,
    `is_deleted` TINYINT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`transaction_id`) REFERENCES `transactions`(`id`)
) ENGINE = InnoDB;
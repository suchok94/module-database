USE `seschool_07`;

DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `categories`;


CREATE TABLE IF NOT EXISTS `categories` (
	`category_id` INT AUTO_INCREMENT PRIMARY KEY,
	`category_name` VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS`products` (
	`product_id` INT AUTO_INCREMENT PRIMARY KEY,
	`product_name` VARCHAR(50),
	`category_id` INT,
	`price` DECIMAL(5,2),
	FOREIGN KEY (`category_id`) REFERENCES `categories`(`categoty_id`)
);
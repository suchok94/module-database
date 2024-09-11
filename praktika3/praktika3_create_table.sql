USE `seschool_07`;

CREATE TABLE IF NOT EXISTS `Customers` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(50) NOT NULL,
	`gender` VARCHAR(10) NOT NULL,
	`age` INT NOT NULL
	);

CREATE TABLE IF NOT EXISTS `Orders` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`customer_id` INT NOT NULL,
	`order_date` DATE NOT NULL,
	FOREIGN KEY (`customer_id`) REFERENCES `Customers`(`id`)
	);
	
CREATE TABLE IF NOT EXISTS `Dishes` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(50) NOT NULL,
	`price` DECIMAL(5,2) NOT NULL,
	`category` VARCHAR(50) NOT NULL
	);

CREATE TABLE IF NOT EXISTS `Order_Dishes` (
	`order_id` INT,
	`dish_id` INT,
	`quanity` INT NOT NULL,
	FOREIGN KEY (`order_id`) REFERENCES `Orders`(id),
	FOREIGN KEY (`dish_id`) REFERENCES `Dishes`(id)
	);

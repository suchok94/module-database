USE `seschool_07`;
/*

-- 1
SELECT `Customers`.`name`, `Orders`.`order_date` 
FROM 	`Customers` INNER JOIN `Orders` ON `Customers`.`id` = `Orders`.`customer_id`
	
	ORDER BY `Customers`.`name` ASC, `Orders`.`order_date` ASC;

-- 2
SELECT `Customers`.`name`,  `Dishes`.`name` 
FROM `Customers` 
INNER JOIN `Orders` ON `Customers`.`id` = `Orders`.`customer_id`
INNER JOIN `Order_Dishes` ON `Orders`.`id` = `Order_Dishes`.`order_id`
INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	ORDER BY `Customers`.`name` ASC, ORDER BY `Dishes`.`name` ASC;
*/	
-- 3
/*
SELECT `Customers`.`name`, SUM(`Dishes`.`price`)
FROM `Customers` 
INNER JOIN `Orders` ON `Customers`.`id` = `Orders`.`customer_id`
INNER JOIN `Order_Dishes` ON `Orders`.`id` = `Order_Dishes`.`order_id`
INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	GROUP BY `Customers`.`id`
	ORDER BY SUM(`Dishes`.`price`) DESC;
	*/
/*
SELECT `Customers`.`name`, COUNT(`Orders`.*)
FROM `Customers` 
INNER JOIN `Orders` ON `Customers`.`id` = `Orders`.`customer_id`
	GROUP BY `Customers`.`id`
	ORDER BY COUNT(`Orders`.*) DESC;	
	
-- 4
SELECT `Customers`.`name`, `Order_Dishes`.`quanity`
FROM `Customers` 
INNER JOIN `Orders` ON `Customers`.`id` = `Orders`.`customer_id`
INNER JOIN `Order_Dishes` ON `Orders`.`id` = `Order_Dishes`.`order_id`
	ORDER BY `Order_Dishes`.`quanity` DESC;

-- 5
SELECT `Dishes`.`name`, SUM(`Order_Dishes`.`quanity`) 
FROM `Dishes`
JOIN `Order_Dishes` ON `Dishes`.`id` = `Order_Dishes`.`dish_id`
	GROUP BY `Order_Dishes`.`dish_id`
	ORDER BY SUM(`Order_Dishes`.`quanity`);

-- 6
SELECT `Customers`.`name` 
FROM `Customers` 
INNER JOIN `Orders` ON `Customers`.`id` = `Orders`.`customer_id`
INNER JOIN `Order_Dishes` ON `Orders`.`id` = `Order_Dishes`.`order_id`
INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	WHERE `Dishes`.price > 50.0;

-- 7
SELECT `Customers`.`name`, `Orders`.`order_date`, SUM(`Order_Dishes`.`quanity`)
FROM `Customers`
INNER JOIN `Orders` ON `Customers`.`id` = `Orders`.`customer_id`
INNER JOIN `Order_Dishes` ON `Orders`.`id` = `Order_Dishes`.`order_id`
	GROUP BY `Order_Dishes`.`quanity`
	ORDER BY `Customers`.`name`, `Orders`.`order_date`;
*/	
-- 8
SELECT `Dishes`.`category`, COUNT(`Order_Dishes`.`order_id`)
FROM `Dishes`
INNER JOIN `Order_Dishes` ON `Dishes`.`id` = `Order_Dishes`.`dish_id`
	GROUP BY `Order_Dishes`.`dish_id`
	ORDER BY COUNT(`Order_Dishes`.`order_id`) DESC;
	
	

	


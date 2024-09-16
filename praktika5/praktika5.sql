-- 1. Найти все продукты, цена которых выше средней цены всех продуктов.
SELECT `products`.`*`
FROM `products`
WHERE `products`.`price` > (SELECT AVG(`products`.`price`)FROM `products`);

-- 2. Найти все категории, в которых хотя бы один продукт имеет цену выше 100.
SELECT `categories`.`*`
FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
WHERE `products`.`price` > 100;

SELECT `categories`.`*`
FROM `categories`
	INNER JOIN (SELECT `products`.`*` FROM `products` WHERE `products`.`price` > 100) AS `prod100` 
	ON `categories`.`category_id` = `prod100`.`category_id`; 

-- 3. Вывести название продукта и количество продуктов в его категории.
SELECT `e1`.`product_name`, (SELECT COUNT(*) FROM `products` WHERE `products`.`category_id` = `e1`.`category_id`)
FROM `products` AS `e1`;

-- 4. Найти продукты, чья цена выше средней цены продуктов в их категории.
SELECT `prod`.`*`
FROM `products` AS prod
WHERE `prod`.`price` > (SELECT  AVG(`products`.`price`) FROM `products` WHERE `products`.`category_id` =  `prod`.`category_id`);

-- 5. Найти категории, в которых средняя цена продуктов выше средней цены по всем продуктам.
SELECT `categories`.`category_name`
FROM `categories`
INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`
HAVING AVG(`products`.`price`) > (SELECT AVG(`price`) FROM `products`);

-- 6. Найти название категории и самую дорогую цену продукта в этой категории.
SELECT `categories`.`category_name`, MAX(`products`.`price`)
FROM `categories`
INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`;
-- +подзапрос

-- 7. Найти продукты, чья цена является самой высокой в своей категории.
SELECT `prod`.`product_name`
FROM `products` AS `prod`
WHERE `prod`.`price` = (SELECT MAX(`price`) FROM `products` WHERE `category_id` = `prod`.`category_id`);

-- 8. Найти категории, в которых количество продуктов больше среднего количества продуктов по всем категориям.
SELECT `categories`.`*`
FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`	
HAVING COUNT(`categories`.`category_id`) > (SELECT AVG(`count_products`)
						FROM (
							SELECT COUNT(*) AS `count_products`
							 FROM `categories` 
							 		INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
							GROUP BY `categories`.`category_id`) AS `categories_products`);

-- 9.  Вывести продукты, цена которых выше средней цены всех продуктов в своей категории.
SELECT `product_name`
FROM `products` AS `prod`
WHERE `price` > (SELECT AVG(`products`.`price`) 
					FROM `products` 
						INNER JOIN `categories` ON `products`.`category_id` = `categories`.`category_id`
					WHERE `prod`.`category_id` = `products`.`category_id`
);

-- 10. Найти категории, где самая низкая цена продукта выше средней цены по всем продуктам.
SELECT `categories`.`*`
FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`
having MIN(`products`.`price`) > (SELECT AVG(`price`) FROM `products`);

-- 11. Найти продукты, цена которых ниже минимальной цены в любой категории.
SELECT `products`.`*`
FROM `products`
WHERE `price` < (SELECT MIN(`price`) 
						FROM `products` 
						WHERE `category_id` IS NOT NULL);

-- 12.  Найти категорию, в которой самое большое количество продуктов.
SELECT `categories`.`*`
FROM `categories`
	INNER JOIN `products` ON `products`.`category_id` = `categories`.`category_id`
GROUP BY `categories`.`category_id`
HAVING COUNT(`categories`.`category_id`) = (SELECT MAX(`asd`.`count_products`) 
														FROM(SELECT COUNT(*) AS `count_products`
																FROM `products` 
																INNER JOIN `categories` ON `products`.`category_id` = `categories`.`category_id`
																GROUP BY `categories`.`category_id`) AS `asd`);

-- 13. Найти продукты, которые дешевле самого дешевого продукта в другой категории.
SELECT `prod1`.`*`
FROM `products` AS `prod1`
WHERE `price` < (SELECT MIN(`price`) 
						FROM `products` 
						WHERE `category_id` != `prod1`.`category_id`);

-- 14. Найти категории, где количество продуктов меньше, чем в категории с минимальным количеством продуктов.
SELECT `categories`.`*`, COUNT(*)
FROM `categories`
	INNER JOIN `products` ON `products`.`category_id` = `categories`.`category_id`
GROUP BY `categories`.`category_id`
HAVING COUNT(*) < (select MIN(`count_products`)
							FROM (SELECT COUNT(*) AS `count_products`
									FROM `categories`
										INNER JOIN `products` ON `products`.`category_id` = `categories`.`category_id`
									GROUP BY `categories`.`category_id`) AS `asd`)
									;

-- 15. Найти продукты, чья цена больше средней цены в категориях с более чем 5 продуктами.
SELECT `products`.*
FROM `products`

WHERE `products`.`price` > (SELECT AVG(`price`) 
									FROM `products` 
									WHERE `products`.`category_id` IN  (SELECT `categories`.`category_id` 
																					FROM `categories`
																						INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
																					GROUP BY `categories`.`category_id`
																					HAVING COUNT(*) > 5))

-- 16. Найти категории, в которых максимальная цена продукта больше 200.
SELECT DISTINCT `categories`.`*`
FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
WHERE `products`.`price` > 200;

-- 17. Найти продукты, которые дороже всех продуктов в другой категории.
SELECT `prod`.`*`
FROM `products` AS prod
WHERE `prod`.`price` > (SELECT MAX(`products`.`price`)
						FROM `products` 
						WHERE `products`.`category_id` != `prod`.`category_id`);
					
-- 18. Найти категории, в которых средняя цена всех продуктов больше 150.
SELECT `categories`.`*`
FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`
HAVING AVG(`products`.`price`) > 150;
	
-- 19. Найти продукты, чья цена ниже минимальной цены в их категории, умноженной на 2.
SELECT `prod`.*
FROM `products` AS `prod`
WHERE `prod`.`price` < 2 * (SELECT MIN(`products`.`price`) FROM `products` WHERE `products`.`category_id` = `prod`.`category_id`);

-- 20. Найти категории, где количество продуктов выше среднего, а средняя цена ниже средней по всем категориям.
SELECT `categories`.*
FROM `categories`
	INNER JOIN `products` ON `products`.`category_id` = `categories`.`category_id`
GROUP BY `categories`.`category_id`
HAVING COUNT(*) > (SELECT AVG(`count_products`)
							FROM (SELECT COUNT(*) AS `count_products`
									FROM `categories`
										INNER JOIN `products` ON `products`.`category_id` = `categories`.`category_id`
									GROUP BY `categories`.`category_id`) AS `asd`)
AND AVG(`products`.`price`) < (SELECT AVG(`products`.`price`) 
															FROM `products`)
									;


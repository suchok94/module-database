USE `seschool_10`;

-- 1
SELECT `Users`.`id`, `Users`.`name`, `Users`.`age`, `Users`.`country` 
FROM `Users` 
	INNER JOIN `Orders` ON `Users`.`id` = `Orders`.`id_user`
	INNER JOIN `Reviews` ON `Users`.`id` = `Reviews`.`id_user`
WHERE `Reviews`.`score` > 4;

-- 2

SELECT `Users`.`name`, `Users`.`age` 
FROM `Users` 
	INNER JOIN `Orders` ON `Users`.`id` = `Orders`.`id_user`
WHERE `Orders`.`sum` > 1000;

-- 3

SELECT `Orders`.`id`, `Orders`.`id_user`, `Orders`.`sum`, `Orders`.`date`, `Users`.`name` 
FROM `Orders`
	INNER JOIN `Users` ON `Orders`.`id` = `Orders`.`id_user`;


-- 4
SELECT `Users`.`name`, `Users`.`counrty` 
FROM `Users` 
	INNER JOIN `Reviews` ON `Users`.`id` = `Reviews`.`id_user`
GROUP BY `Reviews`.`id_user`
HAVING COUNT(`Reviews`.`score`) > 1;


-- 5
SELECT `Orders`.`id`, `Orders`.`id_user`, `Orders`.`sum`, `Orders`.`date` 
FROM `Orders` 
	INNER JOIN `Users` ON `Orders`.`id_user` = `Users`.`id`
	INNER JOIN `Reviews` ON `Users`.`id` = `Reviews`.`id_user`
WHERE `Reviews`.`score` < 3;


-- 6
SELECT `Users`.`id`, `Users`.`name`, `Users`.`age`, `Users`.`country`, `Reviews`.`id`, `Reviews`.`id_user`, `Reviews`.`score`, `Reviews`.`text`
FROM `Users`
	INNER JOIN `Orders` ON `Users`.`id` = `Orders`.`id_user`
	INNER JOIN `Reviews` ON `Users`.`id` = `Reviews`.`id_user`
WHERE `Orders`.`date` > '20240109';


-- 7
SELECT AVG(`Orders`.`sum`), `Users`.`id`, `Users`.`name`, `Users`.`age`, `Users`.`country` 
FROM `Users`
	INNER JOIN `Orders` ON `Users`.`id` = `Orders`.`id_user`
GROUP BY `Orders`.`id_user`;

-- 8 
SELECT `Users`.`id`, `Users`.`name`, `Users`.`age`, `Users`.`country` 
FROM `Users` 
	INNER JOIN `Orders` ON `Users`.`id` = `Orders`.`id_user`
	INNER JOIN `Reviews` ON `Users`.`id` = `Reviews`.`id_user`
WHERE `Users`.`country` = 'Россия' AND `Reviews`.`score` > 3;

-- 9
SELECT `Users`.`name` 
FROM `Users`
	LEFT JOIN `Reviews` ON `Users`.`id` != `Reviews`.`id_user`;

-- 10
SELECT `Reviews`.`id`, `Reviews`.`id_user`, `Reviews`.`score`, `Reviews`.`text`
FROM `Reviews`
	INNER JOIN `Users` ON `Reviews`.`id_user` = `Users`.`id`
	INNER JOIN `Orders` ON `Reviews`.`id_user` = `Orders`.`user_id`
WHERE `Orders`.`sum` < 2000;

USE `seschool_07`;

-- 1
SELECT * 
FROM `Players`
WHERE `experience_points` > (SELECT `experience_points`
										FROM `Players` 
										WHERE `player_name` = 'Марк');

-- 2
SELECT `Players`.`*`
FROM `Players` 
INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`item_type` = 'Броня';

-- 3
SELECT `Items`.`item_name` 
FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Guilds`.`guild_level` = (SELECT MAX(`guild_level`)
									FROM `Guilds`);
									
-- 4
SELECT DISTINCT `Players`.*
FROM `Players`
INNER JOIN `Items` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`rarity` = 'редкий';

-- 5
SELECT * 
FROM `Players`
	INNER JOIN `Items` ON `Items`.`player_id` = `Players`.`player_id`
GROUP BY `Players`.`player_id`

HAVING COUNT(`Items`.`item_id`) > (SELECT COUNT(`Items`.`item_id`)
												FROM `Items` 
													INNER JOIN `Players` ON `Players`.`player_id` = `Items`.`player_id`
												WHERE `Players`.`player_name` = 'Екатерина'); 

-- 6
SELECT DISTINCT `Guilds`.`guild_name`
FROM `Guilds`
	INNER JOIN `Players` ON `Guilds`.`guild_id` = `Players`.`guild_id`
WHERE `Players`.`level` > 20;

-- 7
SELECT DISTINCT `Players`.`*`
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`item_type` = 'оружие' AND `Players`.`player_id` != (SELECT `Players`.`player_id`
																						FROM `Players`
																							INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
																						WHERE `Items`.`item_type` = 'зелье'
);


-- 8
SELECT `Items`.`item_name`
FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Guilds`.`guild_name` = 'Стражи Сервера';

-- 9
SELECT `Players`.`*`
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`rarity` = 'эпический' 
AND `Players`.`player_id` IN (SELECT `Players`.`player_id`
									FROM `Players`
										INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
									GROUP BY `Players`.`player_id`
									HAVING COUNT(`Players`.`player_id`) > 1);


-- 10
SELECT *
FROM `Players`
WHERE `experience_points` > (SELECT AVG(`experience_points`)
FROM `Players`);

-- 11
SELECT `Items`.`item_name`
FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Guilds`.`guild_level` > (SELECT AVG(`guild_level`)
FROM `Guilds`);

-- 12
SELECT `Players`.`*`
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`rarity` = 'редкий' AND `Players`.`experience_points` > (SELECT `experience_points`
FROM `Players`
WHERE `player_name` = 'Дмитрий');

-- 13
SELECT DISTINCT `Guilds`.`guild_name`
FROM `Guilds`
	INNER JOIN `Players` ON `Guilds`.`guild_id` = `Players`.`guild_id`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Players`.`player_id` NOT IN (SELECT `Players`.`player_id`
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`item_type` = 'броня');


-- 14
SELECT `Players`.`*`
FROM `Players`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Guilds`.`guild_level` > (SELECT `guild_level` 
											FROM `Guilds` 
											WHERE `guild_name` = 'Легион');

-- несовсем коректное задания, может вот такое решение?
											
SELECT `Players`.`*`
FROM `Players`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Players`.`experience_points` > (SELECT SUM(`Players`.`experience_points`) 
											FROM `Players` 
												INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
											WHERE `guild_name` = 'Легион');

-- 15. Выбрать всех игроков, у которых количество предметов больше, чем у среднего игрока.
SELECT `Players`.*
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
GROUP BY `Players`.`player_id`
HAVING COUNT(`Items`.item_id) > (SELECT AVG (`count_table`) 
											FROM (
													SELECT COUNT(`Items`.`item_id`) AS `count_table`
													FROM `Items` 
														RIGHT JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
													GROUP BY `Players`.`player_id`
													) AS `Players_Items`
);


-- 16. Найти всех игроков, у которых больше опыта, чем у всех игроков в гильдии с названием "Темный Братство".
SELECT `Players`.`*`
FROM `Players`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Players`.`experience_points` >  IFNULL((SELECT SUM(`experience_points`)
														FROM `Players`
															INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
														WHERE `Guilds`.`guild_name` = 'Темное Братство'), 0);
													
-- 17. Выбрать названия всех предметов, которые принадлежат игрокам, у которых опыт выше, чем у всех игроков в гильдии с названием "Львы".
SELECT `Items`.`item_name`
FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Players`.`experience_points` >  IFNULL((SELECT SUM(`experience_points`)
														FROM `Players`
															INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
														WHERE `Guilds`.`guild_name` = 'Львы'), 0);
	
-- 18. Найти всех игроков, у которых больше опыта, чем у среднего игрока из их гильдии.
SELECT `Players`.*, `GP_guild_name`
FROM `Players`
	INNER JOIN (SELECT AVG(`Players`.`experience_points`) AS avg_points, `Guilds`.`guild_name` AS `GP_guild_name`, `Guilds`.`guild_id` AS `GP_guild_id`
													FROM `Players`
														INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
													GROUP BY `Guilds`.`guild_id`) AS `Guilds_Players` ON `Players`.`guild_id` = `Guilds_Players`.`GP_guild_id`
WHERE `Players`.`experience_points` > `Guilds_Players`.`avg_points`;

-- 19. Найти игроков, у которых больше 1000 опыта и хотя бы один редкий предмет, но при этом они не состоят в гильдии.
SELECT `Players`.`player_name`, `Players`.`experience_points`, `Players`.`guild_id`, `Items`.`*`
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
	INNER JOIN `Guilds` ON `Players`.`player_id` = `Guilds`.`guild_id`
WHERE `Players`.`experience_points` > 1000 AND `Items`.`rarity` = 'редкий' AND `Players`.`guild_id` IS NULL;

-- 20. Найти игроков, у которых опыт больше, чем у игроков, у которых есть хотя бы один эпический предмет.
SELECT `Players`.*
FROM `Players`
WHERE `Players`.`experience_points` > (SELECT MAX(`Players`.`experience_points`)
													FROM `Players`
														INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
													WHERE `Items`.`rarity` = 'эпический');
													
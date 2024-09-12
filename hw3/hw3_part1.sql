USE `seschool_07`;

-- 1
SELECT `player_id`, `player_name`, `level` 
FROM `Players`;

-- 2
SELECT * 
FROM `Players` 
WHERE `guild_id` = 3;

-- 3
SELECT `player_name`, `level` 
FROM `Players`
WHERE `level` >= 10;

-- 4
SELECT `Items`.`item_name` 
FROM `Items` 
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Players`.`player_name` = 'Алекс';

-- 5
SELECT * 
FROM `Items`
WHERE `rarity` = 'редкий';

-- 6
SELECT `item_name` 
FROM `Items`
WHERE `item_type` = 'оружие';

-- 7
SELECT `Guilds`.`guild_name`, COUNT(`Players`.`player_id`) 
FROM `Guilds` 
	INNER JOIN `Players` ON `Guilds`.`guild_id` = `Players`.`guild_id`
GROUP BY `Guilds`.`guild_id`;

-- 8
SELECT `Players`.`player_name` 
FROM `Players` 
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`item_type` = 'броня';

-- 9 
SELECT `Players`.`player_id`, `Players`.`player_name`, `Players`.`level`, `Players`.`experience_points`, `Players`.`guild_id` 
FROM `Players` 
	INNER JOIN `Guilds` ON `Players`.`guild_id` =`Guilds`.`guild_id`
WHERE `Players`.`level` > 5 AND `Guilds`.`guild_level` >= 2;

-- 10
SELECT `Players`.`player_id`, `Players`.`player_name`, `Players`.`level`, `Players`.`experience_points`, `Players`.`guild_id` 
FROM `Players` 
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`rarity` = 'эпический';

-- 11
SELECT `Items`.`item_name`
FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Players`.`level` > 15;

-- 12
SELECT `Items`.`item_id`, `Items`.`item_name`, `Items`.`rarity`, `Items`.`player_id`
FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `guild_name` = 'Клан Дракона';

-- 13
SELECT `Players`.`player_name` 
FROM `Players` 
	LEFT JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`player_id` IS NULL ;

-- 14
SELECT `Players`.`*`
FROM `Players` 
 LEFT JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Players`.`level` > 8 AND `Items`.`item_type` = 'зелье';

-- 15
SELECT `Items`.`item_name` 
FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Guilds`.`guild_level` > 3;

-- 16
SELECT `Players`.`*` 
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Players`.`experience_points` > 500 AND `Items`.`item_type` = 'оружие';

-- 17 
SELECT `Guilds`.`*`
FROM `Guilds`
	LEFT JOIN `Players` ON `Guilds`.`guild_id` = `Players`.`guild_id`
WHERE `Players`.`guild_id` IS NULL ;

-- 18
SELECT `Players`.`player_name`, `Items`.`item_name`
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`rarity` = 'редкий';

-- 19
-- при этом запросе остаются те, у кого есть другие предметы по мимо зелий
SELECT DISTINCT `Players`.`*`
FROM `Players`
	LEFT JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Items`.`item_type` != 'зелье' OR `Items`.`item_type` IS NULL;

-- при этом запросе игроков с зельями отсортирует в отдельном подзапросе,
-- а потом получится список без них, не важно есть у них другие предметы или нет
USE `seschool_07`;

SELECT DISTINCT `Players`.`*`
FROM `Players`
	LEFT JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`

WHERE `Players`.`player_id` != (SELECT `Players`.`player_id` 
											FROM `Players` 
											INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id` 
											WHERE `Items`.`item_type` = 'зелье' );

-- 20
SELECT `Players`.`*`
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Players`.`level` = 20 AND `Items`.`rarity` = 'эпический';
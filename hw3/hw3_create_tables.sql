USE `seschool_07`;

DROP TABLE IF EXISTS `Items`;
DROP TABLE IF EXISTS `Players`;
DROP TABLE IF EXISTS `Guilds`;

CREATE TABLE IF NOT EXISTS `Guilds` (
	`guild_id` INT AUTO_INCREMENT PRIMARY KEY,
	`guild_name` VARCHAR(50),
	`guild_level` INT
);

CREATE TABLE IF NOT EXISTS `Players` (
	`player_id` INT AUTO_INCREMENT PRIMARY KEY,
	`player_name` VARCHAR(50),
	`level` INT,
	`experience_points` INT,
	`guild_id` INT,
	FOREIGN KEY(`guild_id`) REFERENCES `Guilds`(`guild_id`)
);
	
	
CREATE TABLE IF NOT EXISTS `Items` (
	`item_id` INT AUTO_INCREMENT PRIMARY KEY,
	`item_name` VARCHAR(50),
	`rarity` VARCHAR(10),
	`item_type` VARCHAR(20),
	`player_id` INT,
	FOREIGN KEY(`player_id`) REFERENCES `Players`(`player_id`)
);


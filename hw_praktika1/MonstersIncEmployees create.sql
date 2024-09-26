USE `seschool_07`;

CREATE TABLE IF NOT EXISTS `MonstersIncEmployees` (
	`EmployeeID` BIGINT AUTO_INCREMENT,
	`MonsterName` VARCHAR(75) NOT NULL,
	`Type` ENUM('Пугало', 'Помощник', 'Администратор', 'Уборщик', 'Учитель', 'Монстр') NOT NULL DEFAULT 'Монстр',
	`Department` VARCHAR(100) NOT NULL DEFAULT 'Нулевой отдел',
	`MonsterColor` INT(8),
	PRIMARY KEY (`EmployeeID`) );
	
	
ALTER TABLE `MonstersIncEmployees` 
	DROP COLUMN `MonsterColor`,
	ADD COLUMN `ScareLevel` INT NOT NULL DEFAULT 1 CHECK (`ScareLevel` BETWEEN 1 AND 10) ;
USE `seschool_07`;

CREATE TABLE IF NOT EXISTS `Users` ( `id` BIGINT AUTO_INCREMENT PRIMARY KEY, `name` VARCHAR(50), `age` TINYINT, `country` VARCHAR(50));

CREATE TABLE IF NOT EXISTS `Orders` ( `id` BIGINT AUTO_INCREMENT PRIMARY KEY, `id_user` int, `sum` DECIMAL(5,2), `date` DATA, FOREIGN KEY (`id_user`) REFERENCES `Users`(`id`));

CREATE TABLE IF NOT EXISTS `Reviews` ( `id` BIGINT AUTO_INCREMENT PRIMARY KEY, `id_user` int, `score` TINYINT, `text` VARCHAR(100), FOREIGN KEY (`id_user`) REFERENCES `Users`(`id`));

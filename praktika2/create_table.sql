USE `seschool_07`;

CREATE TABLE IF NOT EXISTS `Movies` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`title` VARCHAR(75),
	`release_year` YEAR,
	`genre` VARCHAR(50),
	`rating` DECIMAL(3,1)
	);
	
CREATE TABLE IF NOT EXISTS `Actors` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(75),
	`birth_year` YEAR,
	`nationality` VARCHAR(50)
	);
	
CREATE TABLE IN NOT EXISTS `Movie_Actors`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`role` VARCHAR(75),
	`movie_id` INT,
	`actor_id` INT,
	
  CONSTRAINT `fk_movie_id`
    FOREIGN KEY (`movie_id`) REFERENCES `Movies` (id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
    
   CONSTRAINT `fk_actor_id`
    FOREIGN KEY (`actor_id`) REFERENCES `Actors` (id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
	);
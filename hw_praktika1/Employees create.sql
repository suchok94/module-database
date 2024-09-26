USE `seschool_07`;

CREATE TABLE IF NOT EXISTS `Employees` (
	`EmployeeID` BIGINT AUTO_INCREMENT,
	`FirstName` VARCHAR(50) NOT NULL,
	`LastName` VARCHAR(50) NOT NULL,
	`DateOfBirth` DATE NOT NULL,
	`HireDate` DATE NOT NULL,
	`MiddleName` VARCHAR(50),
	`Salary` FLOAT,
	PRIMARY KEY (`EmployeeID`) 
);

ALTER TABLE `Employees` 
	DROP COLUMN `MiddleName`,
	ADD COLUMN `Position` VARCHAR(100) NOT NULLEmployees;
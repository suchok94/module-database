USE `seschool_07`;
/*
-- 1
SELECT `№`, `Family` AS 'Фамилия', `sex` AS 'Пол',
	`DateOfBirth` AS 'Дата рождения', `SNILS` AS `СНИЛС`,
	`Course` AS 'Курс', `Group` AS 'Группа',
	`Avg_Score` AS 'Средний балл', `Hobby` AS 'Хобби'
FROM `students_table_nickname`
	WHERE `Sex` = 'ж';

-- 2
SELECT * FROM `students_table_nickname`
	WHERE `Course` = 3;

-- 3	
SELECT * FROM `students_table_nickname`
	WHERE `DateOfBirth` > 19940203;

-- 4
SELECT * FROM `students_table_nickname`
	WHERE `Avg_Score` BETWEEN 70 AND 85; 
	
SELECT * FROM `students_table_nickname`
	WHERE `Avg_Score` >= 70 AND `Avg_Score` <= 85; 

-- 5
SELECT * FROM `students_table_nickname`
	WHERE `Course` = 2 OR `Course` = 3;
	
SELECT * FROM `students_table_nickname`
	WHERE `Course` IN (2,3);
	
-- 6
SELECT * FROM `students_table_nickname`
	WHERE `Family` LIKE ('С%') OR `Family` LIKE ('К%');

	
-- 7
SELECT * FROM `students_table_nickname`
	WHERE `sex` = 'ж' AND `Group` LIKE 'АУС%'	

	
	
-- 8
SELECT * FROM `students_table_nickname`
	WHERE `Hobby` IS NULL;
	

-- 9
SELECT `Course` FROM `students_table_nickname`
	GROUP BY `Course`;	
	

-- 10
SELECT * FROM `students_table_nickname`
	ORDER BY `Avg_Score` ASC
	LIMIT 5	
	OFFSET 10
	;
	
-- 11
SELECT * FROM `students_table_nickname`
	ORDER BY `Avg_Score` DESC, `Family` ASC 
	LIMIT 10
	OFFSET 5
	;
	
-- 12
SELECT COUNT(*) AS 'Количество студентов' FROM `students_table_nickname`;

SELECT COUNT(*) AS 'Количество студентов не имеющих хобби' FROM `students_table_nickname`
WHERE `Hobby` is NULL;

SELECT MAX(`Avg_Score`) AS 'Максимальное значение среднего балла' FROM `students_table_nickname`;

SELECT MIN(`Avg_Score`) AS 'Минимальное значение среднего балла' FROM `students_table_nickname`;

SELECT AVG(`Avg_Score`) AS 'Среднее значение по всем студентам среднего балла' FROM `students_table_nickname`;


-- 13
SELECT `Course` AS 'Курс', COUNT(*) AS 'Количество студентов' FROM `students_table_nickname`
	GROUP BY `Course`;

-- 14

SELECT `sex` AS 'Пол', AVG(`Avg_Score`) AS 'Средний балл' FROM  `students_table_nickname`
	GROUP BY `Sex`
	

-- 15
SELECT MAX(`Avg_Score`) FROM `students_table_nickname`
	WHERE `Course` = 3 AND `DateOfBirth` > 19921231
	
-- 16	
SELECT `Family`, `Avg_Score`, 
CASE 
	WHEN `Avg_Score` BETWEEN 0 AND 70 THEN 'Неудовлетворительно'
	WHEN `Avg_Score` BETWEEN 70 AND 80 THEN 'Удовлетворительно'
	WHEN `Avg_Score` BETWEEN 80 AND 90 THEN 'Хорошо'
	WHEN `Avg_Score` BETWEEN 90 AND 100 THEN 'Отлично'
END AS 'Оценка'
 FROM `students_table_nickname`;
	*/		

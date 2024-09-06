SELECT `title` FROM `Movies`
	WHERE `release_year` > 2010 AND `rating` > 8.0
	ORDER BY `rating` DESC;
	
	
SELECT `genre` FROM `Movies`	
	GROUP BY `genre`
	ORDER BY `genre` ASC;
	
	
	
SELECT `title` FROM `Movies`
	ORDER BY `rating` DESC
	LIMIT 10
	OFFSET 10;
	
	
	
SELECT `name` FROM `Actors`
	WHERE `birth_year` < 1980
	ORDER BY `birth_year` ASC;
	

SELECT `name` FROM `Movies`
	WHERE `genre` = 'Sci-Fi'
	ORDER BY `name` ASC;
	

SELECT `nationality` FROM `Actors`
	GROUP BY `nationality`
	ORDER BY `nationality` DESC;
	

SELECT `title`, `rating` FROM `Movies`
	WHERE `rating` < 5.0
	ORDER BY `rating` ASC;
	
	
SELECT `title` FROM `Movies`
	ORDER BY `release_year` DESC
	LIMIT 5;
	
	
SELECT `name` FROM `Actors`
	ORDER BY `birth_year` ASC
	LIMIT 3;
	

	
	

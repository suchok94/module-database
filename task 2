/*
USE `seschool_07`;

2.1
SELECT AVG(`rating`) FROM `Movies`
	GROUP BY `genre`
	ORDER BY AVG(`rating`);

2.2	
SELECT COUNT(*) FROM `Movies`
	GROUP BY `release_year`
	ORDER BY `release_year`;
	
2.3	
SELECT `genre` FROM `Movies`
	GROUP BY `genre`
	HAVING COUNT(*) > 5
	ORDER BY COUNT(*) ASC;
	
2.4	
SELECT `genre`, SUM(`rating`) FROM `Movies`
	GROUP BY `genre`
	HAVING SUM(`rating`) > 50
	ORDER BY SUM(`rating`) ASC;
	
2.5	
SELECT `release_year` FROM `Movies`
	WHERE `rating` > 7.0
	GROUP BY `release_year`
	HAVING COUNT(*) > 5
	ORDER BY COUNT(*) ASC;
	
	

2.6
SELECT `sb_book` FROM `subscriptions`
	GROUP BY `sb_book`;

2.7	
SELECT `sb_book`, COUNT(`sb_start`) FROM `subscriptions`
	GROUP BY `sb_book`;




3.1
SELECT `genre` FROM `Movies`
	GROUP BY `genre`
	HAVING AVG(`rating`) > 6.5 AND COUNT(*) > 10
	ORDER BY AVG(`rating`) DESC;
	
3.2
SELECT `release_year`, MIN(`rating`) FROM `Movies`
	GROUP BY `release_year`
	HAVING COUNT(*) > 3
	ORDER BY `release_year`;
	

3.3

----

3.4
SELECT AVG(`rating`) FROM `Movies`
	WHERE `release_year` < 2000
	GROUP BY `genre`
	HAVING COUNT(*) > 3
	ORDER BY `rating` DESC;

3.5	
SELECT `genre`, MIN(`rating`) FROM `Movies`
	GROUP BY `genre`
	HAVING COUNT(*) > 8
	ORDER BY MIN(`rating`) ASC;
*/	

SELECT *
FROM "WorldPopulations";

--Which city & country has the highest growthrate
SELECT city, country, growthrate
FROM "WorldPopulations"
ORDER BY growthrate DESC;

--Average pop 2023 vs average pop 2022 for each continent
SELECT 
	continent,
	ROUND((AVG(pop2022)),2)AS averagepop2022,
	ROUND((AVG(pop2023)),2)AS averagepop2023
FROM "WorldPopulations"
GROUP BY continent
ORDER BY averagepop2022, averagepop2023 DESC;

--Average pop 2023 vs average pop 2022 for each country
SELECT 
	country,
	ROUND((AVG(pop2022)),2)AS averagepop2022,
	ROUND((AVG(pop2023)),2)AS averagepop2023
FROM "WorldPopulations"
GROUP BY country
ORDER BY averagepop2022, averagepop2023 DESC;

--What is the difference between population in 2022 vs 2023 in Asian countries
SELECT pop2022, pop2023, city, country, continent, (pop2023-pop2022) AS popdifference
FROM "WorldPopulations"
WHERE continent = 'Asia'
ORDER BY popdifference DESC;

--What is the average difference between pop2023 and pop2022 for each continent
SELECT 
	continent, 
	ROUND((AVG(pop2023-pop2022)),2)AS popdifference
FROM "WorldPopulations"
GROUP BY continent
ORDER BY popdifference DESC;

--Countries with a positive growth rate
SELECT pop2022, pop2023, city, country, continent, growthrate, (pop2023-pop2022) AS popdifference
FROM "WorldPopulations"
WHERE growthrate > 0
ORDER BY growthrate DESC;

--Countries with a negative growth rate
SELECT pop2022, pop2023, city, country, continent, growthrate, (pop2023-pop2022) AS popdifference
FROM "WorldPopulations"
WHERE growthrate < 0
ORDER BY growthrate DESC;

--Countries with a decrease in population from 2022 to 2023
SELECT country, continent, SUM(pop2023-pop2022) AS popdecrease
FROM "WorldPopulations"
WHERE (pop2023-pop2022) < 0
GROUP BY country, continent
ORDER BY popdecrease DESC;

--Countries with an increase in population from 2022 to 2023
SELECT country, continent, SUM(pop2023-pop2022) AS popincrease
FROM "WorldPopulations"
WHERE (pop2023-pop2022) > 0
GROUP BY country, continent
ORDER BY popincrease DESC;

--Compare countries growth rate with the average growth rate
SELECT country, ROUND((AVG(growthrate)),3) AS average_growthrate, 
	(SELECT ROUND(AVG(growthrate),3)AS comparative_growthrate FROM "WorldPopulations")
FROM "WorldPopulations"
GROUP BY country
ORDER BY average_growthrate DESC;

--Which countries have average growth rates greather than the comparative growthrate

SELECT country, ROUND((AVG(growthrate)),3) AS average_growthrate, 
	(SELECT ROUND(AVG(growthrate),3)AS comparative_growthrate FROM "WorldPopulations")
FROM "WorldPopulations"
WHERE growthrate > 0.021
GROUP BY country
ORDER BY average_growthrate DESC;

--Continents average growth rate

SELECT continent, ROUND((AVG(growthrate)),3) AS average_growthrate
FROM "WorldPopulations"
GROUP BY continent
ORDER BY average_growthrate DESC;
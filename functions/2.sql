# 2. Escribe una función que devuelva el valor medio de puntos
# por año que ha conseguido un determinado constructor que se
# recibirá como parámetro de entrada. El parámetro de entrada
# será el nombre del constructor.

DELIMITER $$
CREATE FUNCTION getAvgPoints(constructor_name varchar(250))
    RETURNS varchar(250)
    DETERMINISTIC

BEGIN
    DECLARE avg_points DECIMAL(10, 2) DEFAULT 0.0;

    SELECT AVG(yearly_points)
    INTO avg_points
    FROM (SELECT SUM(re.points) AS yearly_points
          FROM constructors c
                   JOIN results re ON c.constructorId = re.constructorId
                   JOIN races ra ON re.raceId = ra.raceId
          WHERE c.name = constructor_name
          GROUP BY ra.year) AS t1;

    RETURN avg_points;

END $$
DELIMITER ;

SELECT getAvgPoints('McLaren') AS avg_points_per_year;
SELECT getAvgPoints('Ferrari') AS avg_points_per_year;
SELECT getAvgPoints('Red Bull') AS avg_points_per_year;
SELECT getAvgPoints('Pizza Lovers') AS avg_points_per_year;

DROP FUNCTION getAvgPoints;
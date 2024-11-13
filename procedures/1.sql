# 1. Crear un procedimiento almacenado de nombre getRacesInYear, que
# obtenga como salida los nombres de las carreras y el numero total
# de constructores que han participado en la carrera, para un año
# concreto que se pasará como parámetro de entrada. En el
# procedimiento no se definirán parámetros de salida.

DELIMITER $$
CREATE PROCEDURE getRacesInYear(IN year int)
BEGIN
    SELECT name, COUNT(DISTINCT re.constructorId) AS total_constructors
    FROM races r
             JOIN results re ON r.raceId = re.raceId
    WHERE r.year = year
    GROUP BY name, r.raceId;
END $$
DELIMITER ;

CALL getRacesInYear(1980);
CALL getRacesInYear(2010);
CALL getRacesInYear(2040);

DROP PROCEDURE getRacesInYear;
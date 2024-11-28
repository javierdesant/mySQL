# 4. Escribe un procedimiento que realice la selección de aquellos
# pilotos que en el año que se le pase como parámetro de entrada,
# obtuvieron un primer, un segundo y un tercer puesto.

DELIMITER $$
CREATE PROCEDURE getPodiumChampion(IN year int)
BEGIN

    SELECT DISTINCT forename, surname
    FROM results re
             JOIN races r ON re.raceId = r.raceId
             JOIN drivers d ON re.driverId = d.driverId
    WHERE positionOrder = 1
      AND r.year = year
      AND re.driverId IN (SELECT driverId
                          FROM results re
                                   JOIN races r ON re.raceId = r.raceId
                          WHERE re.positionOrder = 2
                            AND r.year = year)
      AND re.driverId IN (SELECT driverId
                          FROM results re
                                   JOIN races r ON re.raceId = r.raceId
                          WHERE re.positionOrder = 3
                            AND r.year = year);

END $$
DELIMITER ;

CALL getPodiumChampion(1980);
CALL getPodiumChampion(2010);
CALL getPodiumChampion(2016);
CALL getPodiumChampion(2040);

DROP PROCEDURE getPodiumChampion;
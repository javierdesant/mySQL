# 5. Procedimiento almacenado de nombre getPilotsAndConstructors, que
# tomando como entrada un año concreto, obtenga como salida los nombres
# de todos los pilotos que participaron en el mundial ese año y el equipo
# de constructores con el cual compitieron. Adicionalmente, también se
# quiere obtener el total de puntos que obtuvo cada piloto en el mundial.

DELIMITER $$
CREATE PROCEDURE getPilotsAndConstructors(IN year int)
BEGIN

    SELECT surname, forename, constructorId, puntos
    FROM (SELECT driverId, constructorId, SUM(points) puntos
          FROM results re
                   JOIN races ra ON re.raceId = ra.raceId
          WHERE ra.year = year
          GROUP BY driverId, constructorId) t1
             JOIN drivers ON t1.driverId = drivers.driverId;

END $$
DELIMITER ;

CALL getPilotsAndConstructors(1980);
CALL getPilotsAndConstructors(2010);
CALL getPilotsAndConstructors(2016);
CALL getPilotsAndConstructors(2040);

DROP PROCEDURE getPilotsAndConstructors;
# 17. Obtener el nombre y apellidos de los pilotos y el número de vueltas totales recorridas
# en el año 2011 siempre y cuando sea mayor que la media del número de vueltas totales
# recorridas el año anterior por todos los pilotos.

SELECT surname, forename, SUM(laps)
FROM results re
         JOIN races r ON re.raceId = r.raceId
         JOIN drivers d ON re.driverId = d.driverId
WHERE year = 2011
GROUP BY d.driverId, surname, forename
HAVING SUM(laps) > (SELECT AVG(total)
                    FROM (SELECT SUM(laps) AS total
                          FROM results re
                                   JOIN races r ON re.raceId = r.raceId
                          WHERE year = 2010
                          GROUP BY driverId) AS tabla);
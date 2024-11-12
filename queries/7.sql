# 7. Obtener el nombre y apellidos de los pilotos que durante
# el año 2017 han participado en todas las carreras.

SELECT forename, surname
FROM drivers
WHERE driverId IN (SELECT driverId
                   FROM races r
                            JOIN results re ON r.raceId = re.raceId
                   WHERE year = 2017
                   GROUP BY driverId
                   HAVING COUNT(DISTINCT r.raceId) = (SELECT COUNT(*)
                                                      FROM races
                                                      WHERE year = 2017));
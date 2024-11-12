# 13. Obtener el nombre de los pilotos que durante el año 2017
# consiguieron puntos en todas las carreras.

SELECT forename
FROM drivers d
WHERE driverId IN (SELECT driverId
                   FROM races r
                            JOIN results re ON r.raceId = re.raceId
                   WHERE year = 2017
                     AND points > 0
                   GROUP BY driverId
                   HAVING COUNT(DISTINCT r.raceId) = (SELECT COUNT(*)
                                                      FROM races
                                                      WHERE year = 2017));

SELECT forename
FROM drivers d
WHERE NOT EXISTS(SELECT driverId
                 FROM races r
                 WHERE year = 2017
                   AND NOT EXISTS(SELECT *
                                  FROM results re
                                  WHERE re.raceId = r.raceId
                                    AND re.driverId = d.driverId
                                    AND points > 0));
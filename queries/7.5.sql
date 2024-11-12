# 7.5 Obtener el nombre y apellidos de los pilotos que durante
# el año 2017 han participado en todas las carreras.
# (Usando una doble resta)

SELECT forename, surname
FROM drivers d
WHERE NOT EXISTS(SELECT driverId
                 FROM races r
                 WHERE year = 2017
                   AND NOT EXISTS(SELECT *
                                  FROM results re
                                  WHERE re.raceId = r.raceId
                                    AND re.driverId = d.driverId));
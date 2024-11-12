# 4. Obtener el nombre de los pilotos que han participado
# en al menos 1 carrera del año 2016.

SELECT forename
FROM drivers d
         JOIN results re ON d.driverId = re.driverId
         JOIN races ra ON re.raceId = ra.raceId
WHERE year = 2016
GROUP BY d.driverId;
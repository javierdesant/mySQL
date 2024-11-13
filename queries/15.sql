# 15. De entre todos los pilotos que han participado en todas las rondas
# de clasificación (Q1, Q2 y Q3) del gran premio de Abu Dhabi de 2017,
# obtener el nombre de los pilotos y el id de los equipos, para aquellos
# equipos que tienen a sus dos pilotos en esa situación.

SELECT constructorId, GROUP_CONCAT(DISTINCT forename SEPARATOR ', ') AS drivers
FROM qualifying q
         JOIN drivers d ON d.driverId = q.driverId
         JOIN races r ON q.raceId = r.raceId
         JOIN circuits c ON c.circuitId = r.circuitId
WHERE q1 <> ''
  AND q2 <> ''
  AND q3 <> ''
  AND location = 'Abu Dhabi'
  AND year = 2017
GROUP BY constructorId
HAVING COUNT(DISTINCT forename) = 2;

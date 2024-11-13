# 19.5 Obtener el nombre y los apellidos de los pilotos que han disputado
# al menos la mitad las ediciones del gran premio ‘Australian Grand Prix’.

SELECT forename, surname, COUNT(DISTINCT re.raceId)
FROM drivers d
         JOIN results re ON d.driverId = re.driverId
         JOIN races ra ON re.raceId = ra.raceId
WHERE name = 'Australian Grand Prix'
GROUP BY d.driverId, nationality
HAVING COUNT(DISTINCT re.raceId) >= (SELECT COUNT(*)
                                     FROM races
                                     WHERE name = 'Australian Grand Prix') / 2;
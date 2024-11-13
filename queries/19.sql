# 19. Obtener la nacionalidad de los pilotos que han disputado todas las
# ediciones del gran premio ‘Australian Grand Prix’.

SELECT nationality, COUNT(DISTINCT re.raceId)
FROM drivers d
         JOIN results re ON d.driverId = re.driverId
         JOIN races r ON re.raceId = r.raceId
WHERE name = 'Australian Grand Prix'
GROUP BY d.driverId, nationality
HAVING COUNT(DISTINCT re.raceId) = (SELECT COUNT(*)
                                    FROM races
                                    WHERE name = 'Australian Grand Prix');
# 10. Obtener nombres y apellidos de los pilotos que han
# ganado más de 30 grandes premios así como el número de
# grandes premios que han ganado.

SELECT forename, surname, COUNT(*) AS awards
FROM drivers d
         JOIN results re ON d.driverId = re.driverId
WHERE positionOrder = 1
GROUP BY re.driverId, forename, surname
HAVING COUNT(DISTINCT raceId) > 30;
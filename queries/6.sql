# 6. Nombre y apellidos de los pilotos que nunca han ganado
# una carrera.

SELECT forename, surname
FROM drivers d
WHERE driverId NOT IN (SELECT driverId
                       FROM results
                       WHERE positionOrder = 1);
# 5. Nombre de los constructores con los que han disputado
# carreras más de 50 pilotos diferentes.

SELECT name
FROM constructors c
WHERE constructorId IN (SELECT constructorId
                        FROM results re
                        GROUP BY constructorId
                        HAVING COUNT(DISTINCT driverId) > 50);
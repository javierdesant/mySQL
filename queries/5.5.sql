# 5.5. Nombre de los constructores con los que han disputado
# carreras más de 50 pilotos diferentes.
# (Mostrando también el número de pilotos)

SELECT c.name, COUNT(DISTINCT re.driverId) AS pilotos
FROM constructors c
         JOIN results re ON c.constructorId = re.constructorId
GROUP BY c.constructorId
HAVING pilotos > 50;
# 8. Obtener el nombre, localización, país y año para cada
# circuito de las carreras que se han disputado entre 2015 y 2017,
# ordenado por el id del circuito.

SELECT c.circuitId, year, location, country, c.name, r.name
FROM races r
         JOIN circuits c ON c.circuitId = r.circuitId
WHERE year >= 2015
  AND year <= 2017
ORDER BY c.circuitId;
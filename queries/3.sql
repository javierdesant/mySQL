# 3. Obtener los paises en los que se disputaron carreras
# en el año 2010.

SELECT country
FROM races ra
         JOIN circuits c ON ra.circuitId = c.circuitId
WHERE year = 2010;
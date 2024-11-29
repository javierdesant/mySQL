# 3. Crea un procedimiento almacenado para obtener los pilotos y
# los circuitos que ganaron carreras de un año concreto
# (como argumento) con un constructor del mismo país que el piloto.

# TODO

SELECT *
FROM results re
         JOIN races r ON re.raceId = r.raceId
         JOIN drivers d ON re.driverId = d.driverId
         JOIN constructors co ON re.constructorId = co.constructorId
WHERE positionOrder = 1
  AND year = 2016
  AND d.nationality = co.nationality;

SELECT *
FROM results re
         JOIN races r ON re.raceId = r.raceId
         JOIN drivers d ON re.driverId = d.driverId
         JOIN constructors co ON re.constructorId = co.constructorId
    AND d.nationality = co.nationality
WHERE positionOrder = 1
  AND year = 2016;
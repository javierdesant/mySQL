# 12. Obtener el nombre, apellidos y la velocidad media del
# piloto que obtuvo la vuelta con velocidad media más alta en
# el gran premio de Japón de 2009.

SELECT forename, surname, year, ra.circuitId, fastestLapSpeed, country
FROM drivers d
         JOIN results re ON d.driverId = re.driverId
         JOIN races ra ON ra.raceId = re.raceId
         JOIN circuits c ON ra.circuitId = c.circuitId
WHERE fastestLapSpeed = (SELECT MAX(fastestLapSpeed)
                         FROM results re
                                  JOIN races ra ON ra.raceId = re.raceId
                                  JOIN formula1.circuits c ON c.circuitId = ra.circuitId
                         WHERE year = 2009
                           AND country = 'Japan')
  AND year = 2009
  AND country = 'Japan';
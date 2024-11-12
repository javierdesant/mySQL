# 11. Nombre y apellidos del piloto que obtuvo la vuelta con
# velocidad media más alta así como el circuito y
# el año en el que se obtuvo.

SELECT forename, surname, year, c.name AS circuit_name, fastestLapSpeed
FROM drivers d
         JOIN results re ON d.driverId = re.driverId
         JOIN races ra ON re.raceId = ra.raceId
         JOIN circuits c ON c.circuitId = ra.circuitId
WHERE fastestLapSpeed >= ALL (SELECT fastestLapSpeed FROM results);
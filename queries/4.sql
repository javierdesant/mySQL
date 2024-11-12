# 4. Obtener el nombre de los pilotos que han participado
# en al menos 1 carrera del año 2016.

select forename
from drivers d join results re on d.driverId = re.driverId
               join races ra on re.raceId = ra.raceId
where year = 2016
group by d.driverId;
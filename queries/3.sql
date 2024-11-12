# 3. Obtener los paises en los que se disputaron carreras
# en el año 2010.

select country
from races ra join circuits c on ra.circuitId = c.circuitId
where year = 2010;
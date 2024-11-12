# 1. Obtener el nombre y apellidos de los pilotos españoles.

select forename, surname
from drivers
where nationality = 'spanish';
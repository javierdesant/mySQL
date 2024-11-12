# 1. Obtener el nombre y apellidos de los pilotos españoles.

SELECT forename, surname
FROM drivers
WHERE nationality = 'spanish';
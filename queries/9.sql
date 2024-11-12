# 9. Obtener los constructores que no han participado
# en alguna clasificación.

SELECT *
FROM constructors c
WHERE NOT EXISTS(SELECT constructorId
                 FROM qualifying);
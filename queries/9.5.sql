# 9.5. Contar los constructores que no han participado
# en alguna clasificación.

SELECT COUNT(*) AS constructors
FROM (SELECT *
      FROM constructors c
      WHERE NOT EXISTS(SELECT constructorId
                       FROM qualifying)) AS cn;
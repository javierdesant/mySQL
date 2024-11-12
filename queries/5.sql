# 5. Nombre de los constructores con los que han disputado
# carreras más de 50 pilotos diferentes.

select name
from constructors c
where constructorId in (select constructorId
                        from results re
                        group by constructorId
                        having count(distinct driverId) > 50);
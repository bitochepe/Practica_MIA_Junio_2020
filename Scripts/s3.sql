-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 3) Todos los eventos de las olimpiadas deben ser programados del 24 de julio de 2020 a partir de las 9:00:00 hasta el 09 de agosto de 2020 hasta las 20:00:00.

alter table EVENTO add constraint check_date check
(fecha_hora >= timestamp '2020-07-24 09:00:00' and fecha_hora <= timestamp '2020-08-09 20:00:00'); 
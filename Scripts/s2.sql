-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 2) En la tabla “Evento” se decidió que la fecha y hora se trabajaría en una sola columna.

alter table EVENTO drop fecha;
alter table EVENTO drop hora;
alter table EVENTO add fecha_hora timestamp;
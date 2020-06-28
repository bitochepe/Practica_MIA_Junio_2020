-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 7) Después de que se implementó el script el cuál creó todas las tablas de las bases de datos, el Comité Olímpico Internacional tomó la decisión de
-- eliminar la restricción “UNIQUE” de las siguientes tablas:

alter table PAIS drop constraint pais_nombre_key;
alter table TIPO_MEDALLA add constraint tipo_medalla_medalla_key;
alter table DEPARTAMENTO add constraint departamento_nombre_key;

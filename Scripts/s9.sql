-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 9) En la tabla “Costo_Evento” se determinó que la columna “tarifa” no debe ser entero sino un decimal con 2 cifras de precisión. 
alter table COSTO_EVENTO alter column tarifa type numeric(6,2);
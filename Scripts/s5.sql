-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 5) Se revisó la información de los miembros que se tienen actualmente y antes de que se ingresen a la base de datos el Comité desea que a los miembros
-- que no tengan número telefónico se le ingrese el número por Default 0 al momento de ser cargados a la base de datos. 

alter table MIEMBRO alter column telefono set default 0;


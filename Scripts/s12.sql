-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 12) El comité olímpico quiere replantear las disciplinas que van a llevarse a cabo, por lo cual pide generar el script que elimine todos los registros contenidos
-- en la tabla “DISCIPLINA”

alter table EVENTO drop cod_disciplina;  -- se eiliminan todos los registros de cod_disciplina en eventos
truncate table DISCIPLINA;
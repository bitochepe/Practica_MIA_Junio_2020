-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 12) El comité olímpico quiere replantear las disciplinas que van a llevarse a cabo, por lo cual pide generar el script que elimine todos los registros contenidos
-- en la tabla “DISCIPLINA”

alter table EVENTO drop column DISCIPLINA_cod_disciplina;

alter table DISCIPLINA_ATLETA drop column DISCIPLINA_cod_disciplina;

truncate table DISCIPLINA;

alter table EVENTO add DISCIPLINA_cod_disciplina integer null;
alter table EVENTO add constraint evento_disciplina_cod_disciplina_key 
foreign key (DISCIPLINA_cod_disciplina) references DISCIPLINA(cod_disciplina);

alter table DISCIPLINA_ATLETA add DISCIPLINA_cod_disciplina integer null;
alter table DISCIPLINA_ATLETA add constraint disciplina_atleta_disciplina_cod_disciplina_key 
foreign key (DISCIPLINA_cod_disciplina) references DISCIPLINA(cod_disciplina);
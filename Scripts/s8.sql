-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 8) Después de un análisis más profundo se decidió que los Atletas pueden participar en varias disciplinas y no sólo en una como está reflejado
-- actualmente en las tablas, por lo que se pide que realice lo siguiente.

-- a. Script que elimine la llave foránea de “cod_disciplina” que se encuentra en la tabla “Atleta”.
alter table ATLETA drop constraint atleta_disciplina_cod_disciplina_fkey;

-- Script que cree una tabla con el nombre “Disciplina_Atleta”
create table  DISCIPLINA_ATLETA (
  ATLETA_cod_atleta		integer not null,
  DISCIPLINA_cod_disciplina  integer not null,
  primary key (ATLETA_cod_atleta,DISCIPLINA_cod_disciplina),
  foreign key (ATLETA_cod_atleta) references ATLETA (cod_atleta),
  foreign key (DISCIPLINA_cod_disciplina) references DISCIPLINA (cod_disciplina)
);

-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------


--1) generar el script que crea cada una de las tablas que conforman la base de datos propuesta por el comité olímpico.

create table PROFESION (
  cod_prof integer not null,
  nombre varchar(50) not null unique,

  primary key (cod_prof)
);

create table PAIS (
  cod_pais integer not null,
  nombre varchar(50) not null unique,

  primary key (cod_pais)
);

create table PUESTO (
  cod_puesto integer not null,
  nombre varchar(50) not null unique,

  primary key (cod_puesto) 
);

create table DEPARTAMENTO (
  cod_depto integer not null,
  nombre varchar(50) not null unique,

  primary key (cod_depto)
);

create table MIEMBRO (
  cod_miembro integer not null,
  nombre varchar(100) not null,
  apellido varchar(100) not null,
  edad integer not null,
  telefono integer null,
  residencia varchar(100) null,
  PAIS_cod_pais integer not null,
  PROFESION_cod_prof integer not null,

  primary key (cod_miembro),
  foreign key (PAIS_cod_pais) references PAIS (cod_pais),
  foreign key (PROFESION_cod_prof) references PROFESION (cod_prof)
);

create table PUESTO_MIEMBRO (
  MIEMBRO_cod_miembro integer not null,
  PUESTO_cod_puesto integer not null,
  DEPARTAMENTO_cod_depto integer not null,
  fecha_inicio date not null,
  fecha_fin date null,

  primary key (MIEMBRO_cod_miembro, PUESTO_cod_puesto, DEPARTAMENTO_cod_depto),
  foreign key (MIEMBRO_cod_miembro) references MIEMBRO (cod_miembro),
  foreign key (PUESTO_cod_puesto) references PUESTO (cod_puesto),
  foreign key (DEPARTAMENTO_cod_depto) references DEPARTAMENTO (cod_depto)
);

create table TIPO_MEDALLA (
  cod_tipo integer not null,
  medalla varchar(20) not null unique,

  primary key  (cod_tipo)
);

create table MEDALLERO (
  PAIS_cod_pais integer not null,
  TIPO_MEDALLA_cod_tipo integer not null,
  cantidad_medallas integer not null,

  primary key (PAIS_cod_pais, TIPO_MEDALLA_cod_tipo),
  foreign key (PAIS_cod_pais) references pais (cod_pais),
  foreign key (TIPO_MEDALLA_cod_tipo)   references TIPO_MEDALLA (cod_tipo)
);

create table DISCIPLINA(
  cod_disciplina integer not null,
  nombre varchar(50)  not null,
  descripcion varchar(150) null,

  primary key (cod_disciplina) 
);

create table ATLETA (
  cod_atleta integer not null,
  nombre varchar(50) not null,
  apellido varchar(50) not null,
  edad integer not null,
  participaciones varchar(100) not null,
  DISCIPLINA_cod_disciplina integer not null,
  PAIS_cod_pais integer not null,

  primary key (cod_atleta),
  foreign key (DISCIPLINA_cod_disciplina) references DISCIPLINA (cod_disciplina),
  foreign key (PAIS_cod_pais) references PAIS (cod_pais) 
);

create table CATEGORIA (
  cod_categoria integer not null,
  categoria varchar(50) not null,

  primary key (cod_categoria)
);

create table TIPO_PARTICIPACION (
  cod_participacion integer not null,
  tipo_participacion varchar(100) not null,

  primary key (cod_participacion)  
);

create table EVENTO (
  cod_evento integer not null,
  fecha date not null,
  ubicacion varchar(50) not null,
  hora date not null,
  DISCIPLINA_cod_disciplina Integer not null,
  TIPO_PARTICIPACION_cod_participacion Integer not null,
  CATEGORIA_cod_categoria integer not null,

  primary key (cod_evento),
  foreign key (DISCIPLINA_cod_disciplina) references DISCIPLINA (cod_disciplina),
  foreign key (TIPO_PARTICIPACION_cod_participacion) references TIPO_PARTICIPACION (cod_participacion),
  foreign key (CATEGORIA_cod_categoria) references CATEGORIA (cod_categoria)
);

create table EVENTO_ATLETA (
  ATLETA_cod_atleta integer not null,
  EVENTO_cod_evento integer not null,

  primary key (ATLETA_cod_atleta , EVENTO_cod_evento),
  foreign key (ATLETA_cod_atleta) references ATLETA (cod_atleta),
  foreign key (EVENTO_cod_evento) references EVENTO (cod_evento)
);

create table TELEVISORA (
  cod_televisora integer not null,
  nombre varchar(50) not null,

  primary key (cod_televisora)
);


create table COSTO_EVENTO (
  EVENTO_cod_evento integer not null,
  TELEVISORA_cod_televisora integer not null,
  tarifa integer not null,

  primary key (EVENTO_cod_evento, TELEVISORA_cod_televisora),
  foreign key (EVENTO_cod_evento) references evento (cod_evento),
  foreign key (TELEVISORA_cod_televisora) references televisora (cod_televisora) 
);

-- 2) En la tabla “Evento” se decidió que la fecha y hora se trabajaría en una sola columna.

alter table EVENTO drop fecha;
alter table EVENTO drop hora;
alter table EVENTO add fecha_hora timestamp;


-- 3) Todos los eventos de las olimpiadas deben ser programados del 24 de julio de 2020 a partir de las 9:00:00 hasta el 09 de agosto de 2020 hasta las 20:00:00.

alter table EVENTO add constraint check_date check
(fecha_hora >= timestamp '2020-07-24 09:00:00' and fecha_hora <= timestamp '2020-08-09 20:00:00'); 


-- 4) Se decidió que las ubicación de los eventos se registrarán previamente en una tabla y que en la tabla “Evento” sólo se almacenara la llave foránea
-- según el código del registro de la ubicación, para esto debe realizar lo siguiente: 
-- a. Crear la tabla llamada “Sede” que tendrá los campos:
--    i. Código: será tipo entero y será la llave primaria.
--   ii. Sede: será tipo varchar(50) y será obligatoria.
-- b. Cambiar el tipo de dato de la columna Ubicación de la tabla Evento por un tipo entero.
-- c. Crear una llave foránea en la columna Ubicación de la tabla Evento y referenciarla a la columna código de la tabla Sede, la que fue creada en el paso anterior.

create table SEDE (
  codigo integer not null,
  sede varchar(50) not null,
  primary key (codigo)
);

alter table EVENTO alter column ubicacion type integer using ubicacion::integer;
alter table EVENTO add  foreign key (ubicacion) references sede (codigo);


-- 5) Se revisó la información de los miembros que se tienen actualmente y antes de que se ingresen a la base de datos el Comité desea que a los miembros
-- que no tengan número telefónico se le ingrese el número por Default 0 al momento de ser cargados a la base de datos. 

alter table MIEMBRO alter column telefono set default 0;

-- 6) Generar el script necesario para hacer la inserción de datos a las tablas requeridas.

insert into PROFESION (cod_prof, nombre) values (1,'Medico');
insert into PROFESION (cod_prof, nombre) values (2,'Arquitecto');
insert into PROFESION (cod_prof, nombre) values (3,'Ingeniero');
insert into PROFESION (cod_prof, nombre) values (4,'Secretaria');
insert into PROFESION (cod_prof, nombre) values (5,'Auditor');

insert into PAIS (cod_pais, nombre) values (1,'Guatemala');
insert into PAIS (cod_pais, nombre) values (2,'Francia');
insert into PAIS (cod_pais, nombre) values (3,'Argentina');
insert into PAIS (cod_pais, nombre) values (4,'Alemania');
insert into PAIS (cod_pais, nombre) values (5,'Italia');
insert into PAIS (cod_pais, nombre) values (6,'Brasil');
insert into PAIS (cod_pais, nombre) values (7,'Estados Unidos');

insert into MIEMBRO values (1,'Scott','Mitchell',32,null,'1092 Highland Drive Manitowoc, WI 54220',7,3);
insert into MIEMBRO values (2,'Fanette','poulin',25,2507853,'49, boulevard Aristide Briand 76120 LE GRAND-QUEVILLY',2,4);
insert into MIEMBRO values (3,'Laura','Cunha Silva',55,null,'Rua Onze, 86 Uberaba-MG',6,5);
insert into MIEMBRO values (4,'Juan José','López',38,36985247,'26 calle 4-10 zona 11',1,2);
insert into MIEMBRO values (5,'Arcangela','Panicucci',39,391664921,'Via Santa Teresa, 11490010-Geraci Siculo Pa',5,1);
insert into MIEMBRO values (6,'Jeuel', 'Villalpando',31,null,'Acuña de Figeroa 610680101 Playa Pascual',3,5);

insert into DISCIPLINA values (1,'Atletismo','Saltos de longitud y triples, de altura y con pértiga o garrocha; las pruebas de lanzamiento de martillo, jabalina y disco.');
insert into DISCIPLINA values (2,'Bádminton',null);
insert into DISCIPLINA values (3,'Ciclismo',null);
insert into DISCIPLINA values (4,'Judo','Es un arte marcial que se originó en japón alrededor de 1880');
insert into DISCIPLINA values (5,'Lucha',null);
insert into DISCIPLINA values (6,'Tenis de mesa',null);
insert into DISCIPLINA values (7,'Boxeo',null);
insert into DISCIPLINA values (8,'Natación','Está presente como deporte en los Juegos desde la primera edición de la era moderna, en Atenas, Grecia, en 1896, donde se disputo en aguas abiertas.');
insert into DISCIPLINA values (9,'Esgrima',null);
insert into DISCIPLINA values (10,'Vela',null);

insert into TIPO_MEDALLA values (1,'Oro');
insert into TIPO_MEDALLA values (2,'Plata');
insert into TIPO_MEDALLA values (3,'Bronce');
insert into TIPO_MEDALLA values (4,'Platino');

insert into CATEGORIA values (1,'Clasificatorio');
insert into CATEGORIA values (2,'Eliminatorio');
insert into CATEGORIA values (3,'Final');

insert into TIPO_PARTICIPACION values (1,'individual');
insert into TIPO_PARTICIPACION values (2,'parejas');
insert into TIPO_PARTICIPACION values (3,'equipos');

insert into MEDALLERO values (5,1,3);
insert into MEDALLERO values (2,1,5);
insert into MEDALLERO values (6,3,4);
insert into MEDALLERO values (4,4,3);
insert into MEDALLERO values (7,3,10);
insert into MEDALLERO values (3,2,8);
insert into MEDALLERO values (1,1,2);
insert into MEDALLERO values (1,4,5);
insert into MEDALLERO values (5,2,7);

insert into  SEDE values (1,'Gimnasio Metropolitano de Tokio');
insert into  SEDE values (2,'Jardín del Palacio Imperial de Tokio');
insert into  SEDE values (3,'Gimnasio Nacional Yoyogi');
insert into  SEDE values (4,'Nippon Budokan');
insert into  SEDE values (5,'Estadio Olímpico');


insert into EVENTO values(1,3,2,2,1,'24 july 2020 11:00:00');
insert into EVENTO values(2,1,6,1,3,'26 july 2020 10:30:00');
insert into EVENTO values(3,5,7,1,2,'30 july 2020 18:45:00');
insert into EVENTO values(4,2,1,1,1,'01 august 2020 12:15:00');
insert into EVENTO values(5,4,10,3,1,'08 august 2020 19:35:00');


-- 7) Después de que se implementó el script el cuál creó todas las tablas de las bases de datos, el Comité Olímpico Internacional tomó la decisión de
-- eliminar la restricción “UNIQUE” de las siguientes tablas:

alter table PAIS drop constraint pais_nombre_key;
alter table TIPO_MEDALLA drop constraint tipo_medalla_medalla_key;
alter table DEPARTAMENTO drop constraint departamento_nombre_key;


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


-- 9) En la tabla “Costo_Evento” se determinó que la columna “tarifa” no debe ser entero sino un decimal con 2 cifras de precisión. 
alter table COSTO_EVENTO alter column tarifa type numeric(6,2);


-- 10) Generar el Script que borre de la tabla “Tipo_Medalla”, el registro siguiente:
delete from MEDALLERO where TIPO_MEDALLA_cod_tipo = 4;
delete from TIPO_MEDALLA where cod_tipo = 4;


-- 11) La fecha de las olimpiadas está cerca y los preparativos siguen, pero de último momento se dieron problemas con las televisoras encargadas de
-- transmitir los eventos, ya que no hay tiempo de solucionar los problemas que se dieron, se decidió no transmitir el evento a través de las televisoras
-- por lo que el Comité Olímpico pide generar el script que elimine la tabla “TELEVISORAS” y “COSTO_EVENTO”.

drop table costo_evento;
drop table televisora;


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

-- 13) Los miembros que no tenían registrado su número de teléfono en sus perfiles fueron notificados, por lo que se acercaron a las instalaciones de
-- Comité para actualizar sus datos.

update 	MIEMBRO set telefono = 55464601 where nombre ='Laura' and apellido = 'Cunha Silva' ;
update  MIEMBRO set telefono = 91514243 where nombre = 'Jeuel' and apellido = 'Villalpando' ;
update  MIEMBRO set telefono = 920686670 where nombre = 'Scott' and apellido = 'Mitchell';

-- 14) El Comité decidió que necesita la fotografía en la información de los atletas para su perfil, por lo que se debe agregar la columna “Fotografía” a la tabla
-- Atleta, debido a que es un cambio de última hora este campo deberá ser opcional.

alter table ATLETA add fotografia varchar(100) null;

-- 15) Todos los atletas que se registren deben cumplir con ser menores a 25 años. De lo contrario no se debe poder registrar a un atleta en la base de datos.

alter table ATLETA add constraint check_edad check (edad < 25);

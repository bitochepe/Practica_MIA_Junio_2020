-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 6) Generar el script necesario para hacer la inserción de datos a las tablas requeridas.

insert into PROFESION (cod_prof, nombre) values (1,'Medico');
insert into PROFESION (cod_prof, nombre) values (2,'Arquitecto');
insert into PROFESION (cod_prof, nombre) values (3,'Ingeniero');
insert into PROFESION (cod_prof, nombre) values (4,'Secretaria');
insert into PROFESION (cod_prof, nombre) values (5,'Auditor');

insert into PAIS (cod_prof, nombre) values (1,'Guatemala');
insert into PAIS (cod_prof, nombre) values (1,'Francia');
insert into PAIS (cod_prof, nombre) values (1,'Argentina');
insert into PAIS (cod_prof, nombre) values (1,'Alemania');
insert into PAIS (cod_prof, nombre) values (1,'Italia');
insert into PAIS (cod_prof, nombre) values (1,'Brasil');
insert into PAIS (cod_prof, nombre) values (1,'Estados Unidos');

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
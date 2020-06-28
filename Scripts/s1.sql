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

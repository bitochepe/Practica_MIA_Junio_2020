-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 4) Se decidió que las ubicación de los eventos se registrarán previamente en una tabla y que en la tabla “Evento” sólo se almacenara la llave foránea
-- según el código del registro de la ubicación, para esto debe realizar lo siguiente: 

create table SEDE (
  codigo integer not null,
  sede varchar(50) not null,
  primary key (codigo)
);

alter table EVENTO alter column ubicacion type integer using ubicacion::integer;
alter table EVENTO add  foreign key (ubicacion) references sede (codigo);
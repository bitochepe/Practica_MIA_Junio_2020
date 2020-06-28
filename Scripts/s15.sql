-- ---------------------------------Juan Jose Hernandez Rodriguez, 201612378----------------------------------------------------------

-- 15) Todos los atletas que se registren deben cumplir con ser menores a 25 años. De lo contrario no se debe poder registrar a un atleta en la base de datos.

alter table ATLETA add constraint check_edad check (edad < 25);

2) Empregados por cidade

Crie uma SP que leva o nome de uma cidade e lista os funcionários dessa cidade
Invoque a SP para listar os empregados de Seattle.
SQL SHOW PROCEDURE STATUS
DELIMITER $$
CREATE OR REPLACE PROCEDURE  lista_empregados(

INOUT id int,
OUT nome  varchar(30) 
)
BEGIN

SELECT 
FROM generos as gen;
SET novoid = (SELECT MAX(id) FROM generos) + 1;
INSERT INTO generos (id,nome)
values (novoid, genero_musical);
END $$
DELIMITER ;

CALL  generosmusicais2 ( 'Funk', @novogenero);
select  @novogenero;
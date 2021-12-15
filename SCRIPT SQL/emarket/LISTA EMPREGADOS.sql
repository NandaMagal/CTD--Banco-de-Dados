#1) Empregados

#Crie uma SP que liste os sobrenomes e nomes dos empregados, ordenados alfabeticamente.
#Invoque a SP para verificar o resultado.

DELIMITER $$
CREATE  PROCEDURE lista_empregados7
(
in id int,
OUT nome_emp VARCHAR(30),
OUT sobrenome_emp VARCHAR(30)
)
BEGIN 
	select Nome,Sobrenome
	from empregados
	ORDER BY Nome;
END $$
DELIMITER ;

 CALL lista_empregados7 (10, @nome,@sobrenome);
 SELECT @nome,@sobrenome;

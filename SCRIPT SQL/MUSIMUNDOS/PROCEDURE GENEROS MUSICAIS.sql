#SP: Gêneros musicais - Tabla: Gêneros
#1)Crie um procedimento armazenado que receba um nome de gênero musical como parâmetro e o insira 
#na tabela de gênero. Além disso, o procedimento armazenado deve retornar o ID de gênero que foi inserido.
#Obs! Para calcular o novo id, inclua a seguinte linha dentro do bloco de código da SP: 
#SET novoid = (SELECT MAX(id) FROM generos) + 1; 
#2)Invoque a stored procedure criada para inserir o gênero Funk. Qual id a SP retornou? 
#Consulte a tabela de gêneros para ver as mudanças. 
#3)Repita a etapa anterior inserindo, desta vez, o gênero Tango.

DELIMITER $$
CREATE PROCEDURE insere_generosmusicais
(
    IN genero_musical VARCHAR(20),
    OUT novoid INT
)
BEGIN
    SET novoid = (SELECT MAX(id) FROM generos) + 1;
    
    INSERT INTO generos (id, nome)
    VALUES (novoid, genero_musical);
END $$

DELIMITER ;

CALL insere_generosmusicais ( 'Tango', @novogenero);
select @novogenero;
CALL  insere_generosmusicais( 'Funk', @novogenero);
select  @novogenero;


CALL  insere_generosmusicais ( 'axé', @novogenero);
select  @novogenero;
select *
from generos;
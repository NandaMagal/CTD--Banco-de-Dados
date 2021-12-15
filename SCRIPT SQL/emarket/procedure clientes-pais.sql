#3) Clientes por país

#Crie uma SP que recebe o nome de um país e retorne o número de clientes naquele país.
#Invoque a SP para consultar a quantidade de clientes de Portugal.
DELIMITER $
CREATE PROCEDURE CLIENTES_PAIS
(
IN nome_pais VARCHAR(30),
OUT QUANTIDADE int
)
BEGIN
SELECT COUNT(*) INTO QUANTIDADE
FROM clientes
WHERE Pais=nome_pais;

END $
DELIMITER ;

CALL CLIENTES_PAIS('USA', @QUANTIDADE);
SELECT @QUANTIDADE;
CALL CLIENTES_PAIS('Portugal', @QUANTIDADE);
SELECT @QUANTIDADE
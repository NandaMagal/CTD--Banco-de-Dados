use musimundos;
drop procedure contatos;
DELIMITER $$
CREATE PROCEDURE contatos
(
	IN nome_pais VARCHAR(30),
	IN nome_cidade VARCHAR(100)
)
BEGIN
	SELECT 
		*
	FROM clientes
	WHERE (pais = nome_pais OR nome_pais IS NULL)
		AND (cidade = nome_cidade OR nome_cidade IS NULL);
END $$
DELIMITER ;

CALL contatos ('Brazil', NULL);
CALL contatos (NULL, 'Brasilia');
CALL contatos (NULL, NULL);
CALL contatos ('Brazil', 'Brasilia');

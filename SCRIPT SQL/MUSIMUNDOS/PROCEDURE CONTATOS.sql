#SP: Clientes por País e Cidade
#Tabela: Clientes

#Crie um procedimento armazenado que solicite o nome de um país e uma cidade como parâmetros de entrada e retorne 
#as informações de contato de todos os clientes naquele país e cidade como resultado. Caso o parâmetro cidade esteja vazio,
#todos os clientes do país indicado devem ser exibidos..

DELIMITER $$
CREATE PROCEDURE  contatos3 
(
IN nome_pais VARCHAR(30),
IN nome_cidade VARCHAR(30)
)
BEGIN
SELECT *
FROM clientes
WHERE pais= nome_pais or cidade = nome_cidade;
END $$
DELIMITER ;

CALL  contatos3 ( 'Brazil', '  ' );
CALL contatos3 ('null', 'Brasilia')
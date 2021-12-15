#SP: Clientes por País e Cidade
#Tabela: Clientes

#Crie um procedimento armazenado que solicite o nome de um país e uma cidade como parâmetros de entrada e retorne 
#as informações de contato de todos os clientes naquele país e cidade como resultado. Caso o parâmetro cidade esteja vazio,
#todos os clientes do país indicado devem ser exibidos..
# Invoque o procedimento para obter as informações dos clientes de Brasília, no Brasil.
#Invoque o procedimento para obter as informações de todos os clientes no Brasil.


DELIMITER $$
CREATE PROCEDURE  CONTATOS6
(
IN nome_pais VARCHAR(30),
IN nome_cidade VARCHAR(30)
)
BEGIN
SELECT telefone,nome,sobrenome,endereco,email,pais,cidade
FROM clientes
WHERE pais= nome_pais or cidade = nome_cidade;
END $$
DELIMITER ;

CALL  CONTATOS6 ( 'Brazil', '  ' );
CALL CONTATOS6 ('null', 'Brasilia');
CALL CONTATOS6 ('Spain','');

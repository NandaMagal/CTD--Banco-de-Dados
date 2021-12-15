#Crie uma view chamada FATURAS_NACIONAIS. A view deve ter as seguintes colunas: id da fatura, data da fatura, id do cliente, 
#nome do cliente, sobrenome do cliente e total da fatura, e deve incluir apenas faturas do Brasil (Brazil).
# Em seguida, execute SELECT * FROM FATURAS_NACIONAIS. Quantos registros a consulta retorna?
CREATE VIEW FATURAS_NACIONAIS AS 
SELECT f.id as 'FaturaID',
	f.id_cliente,
	data_fatura,
	c.id as 'ClienteID',
	nome,
	sobrenome,
	valor_total
FROM faturas as f
INNER JOIN clientes as c
ON c.id =f.id_cliente
WHERE pais='Brasil' OR pais='Brazil';

SELECT * FROM FATURAS_NACIONAIS;
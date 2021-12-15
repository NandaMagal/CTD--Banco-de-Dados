# 4)4.	Obtenha uma lista de aluguéis que foram feitos durante o mês de Maio de 2005. 
#Inclua todas as colunas disponíveis no resultado
SELECT loc.locacao_id, loc.data_locacao, loc.cliente_id,
c.cliente_id, c.nome,c.sobrenome
FROM locacao AS loc
INNER JOIN cliente AS c
ON c.cliente_id = loc.cliente_id
having data_locacao >= '2005-05-01' and data_locacao <= '2005-05-31'
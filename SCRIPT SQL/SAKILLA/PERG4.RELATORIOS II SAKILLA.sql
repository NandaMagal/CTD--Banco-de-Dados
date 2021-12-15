#RELATORIOS II-SAKILLA
#4)Gere um relatório que mostre: identificação do cliente, quantidade  de locações e valor total de todos os clientes 
#que gastaram mais de $ 150 em locações.

SELECT c.cliente_id,c.nome,
COUNT(loc.locacao_id) AS 'Quantidade', loc.cliente_id,
pag.cliente_id, pag.locacao_id, SUM(pag.valor),pag.data_pagamento
FROM cliente AS c 
INNER JOIN locacao AS loc
ON c.cliente_id=loc.cliente_id
INNER JOIN pagamento as pag
ON loc.cliente_id = pag.cliente_id
GROUP BY c.cliente_id
having SUM(pag.valor) >= 150
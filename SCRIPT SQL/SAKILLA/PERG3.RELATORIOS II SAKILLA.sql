#exercicio 3
#3)relatorios II sakilla
#gere um relatorio que respnda a pergunta quais são os 10 clientes que mais dinheiro gastam e quantas locacoes fizeram?

SELECT c.cliente_id,c.nome,
loc.locacao_id, loc.cliente_id,
pag.cliente_id, pag.locacao_id, SUM(pag.valor),pag.data_pagamento
FROM cliente AS c 
INNER JOIN locacao AS loc
ON c.cliente_id=loc.cliente_id
INNER JOIN pagamento as pag
ON loc.cliente_id = pag.cliente_id
GROUP BY c.cliente_id
order by SUM(pag.valor) desc
limit 10
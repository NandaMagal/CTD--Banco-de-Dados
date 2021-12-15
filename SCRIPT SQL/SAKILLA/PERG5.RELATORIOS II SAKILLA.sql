#5) gerre um relatorio que mostre por mês o valor das locacoes e a quantidade de locações para o ano de 2005;

SELECT c.cliente_id,c.nome,
COUNT(loc.locacao_id) AS 'QUANTIDADE LOCACOES', loc.cliente_id,
pag.cliente_id, pag.locacao_id, SUM(pag.valor),pag.data_pagamento
FROM cliente AS c 
INNER JOIN locacao AS loc
ON c.cliente_id=loc.cliente_id
INNER JOIN pagamento as pag
ON loc.cliente_id = pag.cliente_id
GROUP BY loc.cliente_id
HAVING pag.data_pagamento like '%2005-%__%-%__%'
-- EXTRACT (MOUNTH,pag.data_pagamento ),

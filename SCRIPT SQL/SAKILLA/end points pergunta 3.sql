#Gere um relatório que responda à pergunta: Como se distribui a quantidade
# e o valor total das locações nos meses pertencentes ao ano  de 2005? (Tabela pagamento).
select pag.cliente_id,count(locacao_id),sum(pag.valor) as total,pag.data_pagamento as Meses
from pagamento as pag
inner join cliente as c
on c.cliente_id = pag.cliente_id
group by pag.cliente_id
having pag.data_pagamento >= '2005-01-01' and pag.data_pagamento <= '2005-12-31'
#Mãos à obra:

#Gere um relatório que responda à pergunta: quais são os dez clientes que mais gastam e quantos aluguéis fizeram?


select pag.cliente_id,count(locacao_id),sum(pag.valor)
from pagamento as pag
inner join cliente as c
on c.cliente_id = pag.cliente_id
group by c.cliente_id
limit 10

#Gere um relatório que indique: a identificação do cliente, o número de locações e o valor total
# para todos os clientes que gastaram mais de $ 150  em locações.

select pag.cliente_id,count(locacao_id),sum(pag.valor) as total
from pagamento as pag
inner join cliente as c
on c.cliente_id = pag.cliente_id
group by c.cliente_id
having sum(pag.valor) >150.00
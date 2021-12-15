#26) O País que tem a maior quantidade de clientes e, consequentemente, o maior valor de faturas acumuladas é: *
select count(c.id),c.pais
from clientes as c
inner join faturas as f
on c.id=f.id_cliente
group by c.pais
ORDER BY c.pais ASC

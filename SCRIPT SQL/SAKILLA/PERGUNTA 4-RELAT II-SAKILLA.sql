#Gere um relatório que mostre: identificação do cliente, quantidade  de locações e valor total de todos os 
#clientes que gastaram mais de $ 150 em locações.
SELECT 
    c.cliente_id, 
        concat(c.nome,    ' ', c.sobrenome) AS cliente,
    count(p.locacao_id) as locacao, 
        sum(p.valor) AS Total
FROM cliente c
INNER JOIN pagamento p
    ON c.cliente_id = p.cliente_id
GROUP BY c.nome
HAVING TOTAL  > 150
ORDER BY TOTAL DESC;
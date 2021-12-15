-- 2 - Selecione o nome do cliente (clientes) e suas faturas (faturas), porém somente as faturas com valor maior de 
#5 ordenados pelo valor da fatura decrescente.
SELECT c.id, c.nome,c.sobrenome,f.id_cliente, f.valor_total
FROM  clientes as c
INNER JOIN faturas AS f
ON c.id = f.id_cliente
HAVING f.valor_total > '5'
ORDER BY f.valor_total DESC;
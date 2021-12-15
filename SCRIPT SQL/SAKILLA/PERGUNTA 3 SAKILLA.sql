#Gere um relatório que responda à pergunta: quais são os dez clientes que mais dinheiro gastam e quantas locações fizeram?
SELECT c.cliente_id, c.nome, c.sobrenome,
pag.cliente_id, max(pag.valor) AS 'VALOR GASTO',  count(pag.pagamento_id) AS'QUANTIDADE DE LOCACOES'
FROM cliente AS c
INNER JOIN pagamento as pag
ON  c.cliente_id = pag.cliente_id
GROUP BY c.cliente_id
ORDER BY pag.valor DESC
LIMIT 10

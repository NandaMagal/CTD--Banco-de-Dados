#Na tabela “Pagamento” calcule a quantidade de pagamentos e o valor total (valor) para o cliente_id = “10”
SELECT COUNT(pag.pagamento_id) AS 'QUANTIDADE pg',sum(pag.valor) as total
FROM pagamento as pag
inner join cliente as c 
on c.cliente_id=pag.cliente_id
where  pag.cliente_id ='10'

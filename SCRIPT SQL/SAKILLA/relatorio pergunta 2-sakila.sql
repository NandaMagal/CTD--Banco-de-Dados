#Obtenha a soma TOTAL de todos os pagamentos, use um Alias para mostrá-lo em uma coluna chamada "TOTAL",
# uma coluna com a quantidade de locações com o alias "Quantidade" e uma coluna indicando o "Valor Médio ”por locação;
SELECT SUM(pag.valor) AS 'TOTAL', 
count(pag.pagamento_id) as 'QUANTIDADE',
avg (pag.valor) as 'Valor Médio por locação'
FROM pagamento AS pag
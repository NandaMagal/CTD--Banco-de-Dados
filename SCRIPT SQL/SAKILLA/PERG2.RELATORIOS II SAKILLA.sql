#aula 16-Relatorios II
#Obtenha a soma TOTAL de todos os pagamentos, use um Alias para mostrá-lo em uma coluna chamada "TOTAL", 
#uma coluna com a quantidade de locações com o alias "Quantidade" e uma coluna indicando o "Valor Médio ”por locação;
SELECT sum(valor) as 'TOTAL', COUNT(pagamento_id) AS 'Quantidade', AVG(valor) AS 'Valor Médio ”por locação'
FROM pagamento as pag
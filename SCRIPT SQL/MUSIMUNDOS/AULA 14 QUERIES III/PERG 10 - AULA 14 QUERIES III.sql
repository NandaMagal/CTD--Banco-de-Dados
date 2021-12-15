#10) Funções MySQL I #4 - Última fatura: Faça uma consulta ao banco de dados que traga todas as faturas do cliente número 2
# solicitadas por sua data e extraia o mês.
 #Qual foi o mês da sua última fatura?RESPOSTA 12
 
 SELECT id_cliente,data_fatura#(select EXTRACT (MONTH from data_fatura))
 FROM faturas
 where id_cliente='2';
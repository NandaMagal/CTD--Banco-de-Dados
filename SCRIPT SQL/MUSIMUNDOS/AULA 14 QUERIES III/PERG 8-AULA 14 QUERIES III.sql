#8)Funcoes MySQL I #2 - Faturas: Faça uma consulta ao banco de dados que nos traga a primeira coluna não nula que encontrar 
#entre as colunas estado_cobranca, pais_cobranca e cep_cobranca. 
#O primeiro resultado obtido é:

SELECT id,id_cliente, COALESCE(estado_cobranca,pais_cobranca,cep_cobranca) AS COBRANCA
FROM faturas
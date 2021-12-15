#9)Funcoes MySQL I #3 - Idade Empregados: Faça uma consulta no banco de dados que mostre a diferença entre sua data de nascimento 
#e a data de contratação.Digite a terceira diferença que você obteve. DICA: Lembre-se de que DATEDIFF () retorna a diferença
#entre as datas expressas em DIAS. Levando isso em consideração e sabendo que um ano tem 365 dias, como você faria a consulta?
#Para ajudá-lo, apresentamos a função FLOOR (), que arredonda qualquer número para casas decimais.

SELECT DATEDIFF (data_contratacao,data_nascimento) AS DIAS
FROM empregados

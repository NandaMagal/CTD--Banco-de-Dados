#Relatórios parte 2: Adicionar complexidade
#Se chegarmos até aqui, é porque já sabemos claramente qual é a estrutura básica de um SELECT. 
#Nos relatórios a seguir, adicionaremos complexidade.
#Vamos  testar?
#1.	Obtenha o valor TOTAL de locações, use um Alias para mostrá-lo em uma coluna chamada "Quantidade";

SELECT sum(valor) AS Quantidade
from pagamento 

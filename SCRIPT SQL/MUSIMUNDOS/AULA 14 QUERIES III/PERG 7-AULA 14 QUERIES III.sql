#7) Funcoes MySQL I #1 - Ranking cancoes 2: O departamento de desenvolvimento da Musimundos está preparando a parte
# do aplicativo em que acessamos uma determinada música. Eles nos dizem que um texto específico deve aparecer abaixo 
#da imagem da música:"A música" (nome do tema) "foi composta por" (compositor do tema).Faça uma consulta ao nosso banco
#de dados que nos traga o nome e o compositor de cada música, sem repetições, adicionando o texto acima. O primeiro resultado é:
#RESPOSTA: A música For Those About To Rock (We Salute You) foi composta por Angus Young, Malcolm Young, Brian Johnson

SELECT concat('A música ' , c.nome ,'foi composta por ' ,  c.compositor)
FROM cancoes as c

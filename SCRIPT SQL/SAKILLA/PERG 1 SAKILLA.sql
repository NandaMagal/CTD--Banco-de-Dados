#Relatórios parte 1:
#Obtenha o nome e o sobrenome dos primeiros 5 atores disponíveis, use Alias para exibir
# os nomes das colunas com a primeira letra maiúscula.

SELECT ator_id AS 'CODIGO ATOR',nome AS 'NOME',sobrenome AS 'SOBRENOME'
FROM ator
LIMIT 5




#1 - Faça uma consulta no banco de dados onde mostre todos os registros 
#que contenham músicas com seus gêneros, E que o compositor seja Willie Dixon, E que tenham o gênero Blues.
# A 2ª música encontrada foi:

SELECT c.id_genero,c.nome,c.compositor,g.id,g.nome
FROM cancoes AS c
INNER JOIN  generos AS g
   ON c.id_genero = g.id
WHERE c.compositor = 'Willie Dixon' AND g.nome = 'Blues' 


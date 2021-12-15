#Joins #1 - Faça uma consulta ao nosso banco de dados que nos retorna as únicas músicas que possuem gênero rock.
# Qual é a música que aparece em quarto lugar?

SELECT c.id_genero,c.nome,g.id,g.nome
FROM cancoes AS c
INNER JOIN  generos AS g
   ON c.id_genero = g.id
where g.nome = 'Rock'

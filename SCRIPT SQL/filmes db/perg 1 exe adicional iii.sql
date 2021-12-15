#1)Join
#Utilizando a base de dados filmes_db, queremos saber, por um lado, os títulos e nomes dos gêneros de todas as séries registradas.

SELECT s.id,s.titulo,g.id,g.nome
from series as s
inner JOIN generos as g
ON g.id=s.id


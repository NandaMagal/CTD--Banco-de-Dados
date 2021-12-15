#Obtenha os filmes onde mais de um artista participou de acordo com nosso banco de dados.
SELECT f.id, f.titulo,f.ano,
       af.filme_id, af.artista_id,
       art.id,art.nome
FROM filmes AS f
INNER JOIN artista_filmes as af
ON f.id=af.filme_id
INNER JOIN artista as art
ON art.id = af.artista_id
       
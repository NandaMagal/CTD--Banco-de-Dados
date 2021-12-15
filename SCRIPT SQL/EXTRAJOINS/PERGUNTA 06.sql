#6)Obtenha os artistas que atuaram em dois ou mais filmes de acordo com nosso banco de dados.
SELECT f.id, f.titulo,f.ano,
       af.filme_id, af.artista_id,
       art.id,art.nome
FROM artista AS art
INNER JOIN artista_filmes as af
ON art.id = af.artista_id
INNER JOIN filmes as f
ON f.id = af.filme_id

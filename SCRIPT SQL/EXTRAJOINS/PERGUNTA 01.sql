#Obtenha os artistas que atuaram em um ou mais filmes.
SELECT art.id, art.nome, art.sobrenome,
      af.artista_id
FROM artista AS art
INNER JOIN artista_filmes AS af
ON art.id = af.artista_id



       
#5) Pegue aqueles artistas que não atuaram em um filme, de acordo com nosso banco de dados.
SELECT art.id, art.nome,art.sobrenome,
af.artista_id
from artista_filmes AS af
RIGHT JOIN artista  AS art
ON  af.artista_id = art.id
where isnull (af.artista_id )
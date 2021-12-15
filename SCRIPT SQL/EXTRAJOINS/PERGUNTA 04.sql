#Obtenha filmes que não foram atribuídos a artistas em nosso banco de dados.
SELECT f.id, f.titulo,
af.filme_id
FROM artista_filmes AS af
RIGHT JOIN filmes  AS f
ON  af.filme_id = f.id 
where isnull (af.filme_id )
#7)Obtenha os filmes que têm um ou mais artistas atribuídos, mesmo aqueles que ainda não foram atribuídos a um 
#artista em nosso banco de dados.
SELECT f.id, f.titulo,f.ano,
       af.filme_id
FROM filmes as f
RIGHT JOIN artista_filmes AS af
ON af.filme_id = f.id 
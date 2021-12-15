#Liste todos os artistas, mesmo aqueles que ainda não atuaram em nenhum filme, de acordo com nosso banco de dados.
SELECT art.id, art.nome,art.sobrenome,
       af.artista_id
FROM artista As art
LEFT JOIN artista_filmes AS af
ON art.id = af.artista_id


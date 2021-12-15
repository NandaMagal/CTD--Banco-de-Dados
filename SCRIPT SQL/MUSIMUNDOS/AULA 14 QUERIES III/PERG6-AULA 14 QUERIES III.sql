#6) Distinct #2 - Ranking cancoes: Faça uma consulta com o nome de todas as músicas que estão em uma lista de reprodução, 
#e o nome da lista de reprodução a que pertencem.Observação! Tenhamos cuidado para não repetir os nomes das músicas.Para esta consulta,
# teremos que usar informações das tabelas cancoes, cancoes_playlists e playlists. O título da música na 5a. posição é:
#resposta; Princess of the Dawn
SELECT DISTINCT c.nome , p.nome, cp.id_playlist , cp.id_cancao , c.id ,  p.id 
FROM cancoes as c
INNER JOIN cancoes_playlists as cp
on c.id = cp.id_cancao
INNER JOIN playlists as p
on p.id = cp.id_playlist
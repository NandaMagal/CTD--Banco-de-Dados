#Usando a base musimundos_V2, execute as seguintes consultas:
-- 1 - Selecione o nome dos artistas(tabela artistas)  com o nome de seus albuns (tabela albuns) ordenado por id do artista.
SELECT DISTINCT art.id, art.nome, alb.id, alb.titulo
FROM artistas AS art
INNER JOIN albuns AS alb
ON art.id = alb.id;



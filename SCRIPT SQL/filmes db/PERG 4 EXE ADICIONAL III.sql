#4)Faça uma consulta  que mostre a quantidade  de filmes por gênero.
SELECT COUNT(genero_id)AS 'TOTAL'
FROM filmes
WHERE genero_id<>'NULL'
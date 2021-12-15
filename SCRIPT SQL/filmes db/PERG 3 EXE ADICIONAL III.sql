#3)Para o nosso próximo desafio, precisamos obter todos os atores ou atrizes (nome e sobrenome)
# que trabalharam em qualquer filme de Harry Potter.

SELECT atores_id, atores.nome, atores.sobrenome, f.id  , f.titulo, a.movie_id, a.ator_id
FROM filmes as f
INNER JOIN ator_filme as a
on f.id = a.movie_id
inner join atores 
on  atores.id = a.ator_id 
where f.titulo LIKE '%Harry Potter%';
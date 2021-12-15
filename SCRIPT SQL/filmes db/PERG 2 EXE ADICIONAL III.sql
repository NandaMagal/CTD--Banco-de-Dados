#2)Por outro lado, precisamos listar os títulos dos episódios juntamente com os nomes e sobrenomes 
#dos atores que atuam em cada um deles.
SELECT ep.id, ep.titulo, a.episodio_id, a.ator_id, ator.id, ator.nome, ator.sobrenome
from ator_episodio as a
inner JOIN  episodios as ep
LEFT join atores as ator
on  ator.id=a.ator_id
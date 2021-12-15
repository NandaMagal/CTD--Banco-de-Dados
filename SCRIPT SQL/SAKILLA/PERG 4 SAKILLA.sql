#3)Obtenha uma lista de filmes, incluindo título, ano e descrição dos filmes que têm uma duracao_locacao maior que cinco.
# Classificar por duracao_locacao descendente e use Alias para exibir os nomes das colunas com a primeira letra maiúscula.
SELECT filme_id AS 'Código Filme',titulo as 'Titulo',ano_lancamento as 'Ano Lançamnento ',descricao as 'Descrição', duracao_locacao as 'Duração da Locação'
from filme
where duracao_locacao > '5'
order by duracao_locacao desc



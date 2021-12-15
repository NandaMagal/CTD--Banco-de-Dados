-- 3. Liste as categorias e seus produtos, incluindo as categorias para as quais não há produtos no banco de dados.
-- Para nomes de produtos, onde mix ou Chef diz, substituí-lo por MIX ou CHEF, respectivamente. Por exemplo: Em vez de Filo Mix,
-- coloque Mix Edge.
SELECT prod.CategoriaID,prod.ProdutoNome,cat.CategoriaID, cat.CategoriaNome
REPLACE(prod.ProdutoNome, 'mix', 'MIX'),
REPLACE	'
FROM produtos AS prod
	LEFT JOIN categorias AS cat
	ON prod.CategoriaID = cat.CategoriaID
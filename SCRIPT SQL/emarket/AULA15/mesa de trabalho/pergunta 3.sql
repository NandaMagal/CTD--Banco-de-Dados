#3. Liste as categorias e seus produtos, incluindo as categorias para as quais não há produtos no banco de dados.
#Para nomes de produtos que contenham as palavras mix ou Chef, substituí-lo por MIX ou CHEF(maiúsculo), 
#respectivamente. Por exemplo: Em vez de Filo Mix, coloque Filo MIX..
SELECT cat.CategoriaID,prod.ProdutoNome,prod.CategoriaID
-- select replace(prod.ProdutoNome,'Mix','MIX');
-- select replace(prod.ProdutoNome,'Chef','CHEF')
from produtos as prod
left join categorias as cat
on cat.CategoriaID=prod.CategoriaID
-- group by categorias
-- having prod.ProdutoID is null;




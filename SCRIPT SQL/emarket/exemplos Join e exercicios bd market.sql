/*
Faça uma consulta sobre o faturamento do e-market. Inclua as seguintes informações:
ID da fatura
data da fatura
nome da empresa de correio (O id da empresa consta da tabela faturas no campo FormaEnvio)
nome do cliente
categoria do produto vendido
nome do produto(Você chega ao produto consultando os detalhes da fatura)
preço unitário
quantidade
*/
SELECT
    fat.faturaId,
    DATE_FORMAT(fat.dataFatura, '%d/%m/%Y') AS data_fatura,
    c.Empresa,
    cli.Empresa,
    cat.CategoriaNome as Categoria,
    prod.ProdutoNome as Produto,
    DetalheFatura.PrecoUnitario,
    DetalheFatura.Quantidade
FROM Faturas as fat # ID da fatura e data da fatura
INNER JOIN Correios as c
    ON fat.FormaEnvio = c.CorreioID # nome da empresa de correio da fatura
    
INNER JOIN Clientes as cli
    ON cli.ClienteID = fat.ClienteID # nome do cliente que comprou/faturou algo
    
INNER JOIN DetalheFatura # preço unitário, quantidade
    ON DetalheFatura.FaturaID = fat.faturaID
    
INNER JOIN Produtos as prod # nome do produto
    ON DetalheFatura.ProdutoID = prod.ProdutoId
    
INNER JOIN Categorias as cat
    ON prod.categoriaID = cat.categoriaId # categoria do produto vendido
ORDER BY fat.faturaID;

Exemplo com group by
SELECT
    fat.faturaId,
    DATE_FORMAT(fat.dataFatura, '%d/%m/%Y') AS data_fatura,
    c.Empresa,
    cli.Empresa
    -- cat.CategoriaNome,
    -- prod.ProdutoNome as Produto
FROM Faturas as fat # ID da fatura e data da fatura
INNER JOIN Correios as c
    ON fat.FormaEnvio = c.CorreioID # nome da empresa de correio da fatura
    
INNER JOIN Clientes as cli
    ON cli.ClienteID = fat.ClienteID # nome do cliente que comprou/faturou algo
    
INNER JOIN DetalheFatura # preço unitário, quantidade
    ON DetalheFatura.FaturaID = fat.faturaID
    
INNER JOIN Produtos as prod # nome do produto
    ON DetalheFatura.ProdutoID = prod.ProdutoId
    
INNER JOIN Categorias as cat
    ON prod.categoriaID = cat.categoriaId # categoria do produto vendido
GROUP BY
    fat.faturaId,
    fat.dataFatura,
    c.Empresa,
    cli.Empresa
    -- cat.CategoriaNome,
    -- prod.ProdutoNome
ORDER BY fat.faturaID;

/*
OK - Liste todas as categorias junto com informações sobre seus produtos. Incluir todas as categorias, mesmo que não tenham produtos.
OK - Liste as informações de contato de clientes que nunca compraram no emarket.
- Faça uma lista de produtos. Para cada um, indique seu nome, categoria e as informações de contato de seu fornecedor. 
Lembre-se que podem existir produtos para os quais o fornecedor não foi indicado.
- Para cada categoria, liste o preço unitário médio de seus produtos.
- Para cada cliente, indique a última nota fiscal de compra. Inclua clientes que nunca compraram no e-market.
- Todas as faturas têm uma empresa de correio associada (envio). Gere uma lista com todas as empresas de correio e o número de faturas correspondentes. 
Execute a consulta usando RIGHT JOIN.
*/

# 1
SELECT
    categorias.*
FROM categorias
LEFT JOIN produtos
    ON categorias.CategoriaID = produtos.CategoriaID;

# 2
SELECT
    COUNT(*)
FROM clientes
LEFT JOIN faturas
    ON clientes.ClienteID = faturas.ClienteID
WHERE faturas.ClienteID IS NOT NULL;
[22:57]
Queries diferentes com o mesmo retorno:
SELECT
    COUNT(*)
FROM clientes
LEFT JOIN faturas
    ON clientes.ClienteID = faturas.ClienteID
WHERE faturas.ClienteID IS NOT NULL;

SELECT
    COUNT(*)
FROM clientes
INNER JOIN faturas
    ON clientes.ClienteID = faturas.ClienteID;

8

4
16 de setembro de 2021

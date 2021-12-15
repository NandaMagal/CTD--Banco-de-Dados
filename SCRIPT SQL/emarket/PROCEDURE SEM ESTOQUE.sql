#Use emarket;
/*
4) Produtos sem estoque

Crie uma SP que receba um número e liste os produtos cujo estoque está abaixo desse número. 
O resultado deve mostrar o nome do produto, o Estoque atual e o nome da categoria à qual o produto pertence.
CALL -> Liste os produtos com menos de 10 unidades no estoque;
CALL -> Liste os produtos sem estoque.
*/
DELIMITER $
CREATE PROCEDURE despedida_banco2
(
    IN p_quantidade FLOAT
)
	BEGIN
    SELECT
        Produtos.ProdutoNome as produto,
        Produtos.unidadesEstoque as estoqueAtual,
        categorias.categoriaNome ,
       CONCAT('produtos menores que ', p_quantidade) as tot
    FROM Produtos
    INNER JOIN categorias
        ON categorias.categoriaId = Produtos.categoriaId
    WHERE Produtos.unidadesEstoque < p_quantidade
        AND Produtos.unidadesEstoque > 0 ;
 /*   SELECT
        Produtos.ProdutoNome as produto,
        Produtos.unidadesEstoque as estoqueAtual,
        categorias.categoriaNome,
        'produtos sem estoque' as tot
    FROM Produtos
    INNER JOIN categorias
        ON categorias.categoriaId = Produtos.categoriaId
    WHERE Produtos.unidadesEstoque = 0; /*
END $
DELIMITER ;

call despedida_banco2(10);

call despedida_banco2(1);

#Crie uma View chamada Faturas_Brazil, que exiba o nome e sobrenome dos clientes, o país de cobrança e a 
#soma das faturas dos clientes cujo país de cobrança seja ‘Brazil’. 
#Execute a view e responda: Qual o valor da fatura mais cara?
CREATE OR REPLACE VIEW Faturas_Brasil
AS
    SELECT
        f.id_cliente,
        cli.nome,
        cli.sobrenome,
        f.pais_cobranca,
        SUM(f.valor_total) AS total_cliente
    FROM clientes as cli
    INNER JOIN faturas as f
        ON cli.id = f.id_cliente
    WHERE f.pais_cobranca = 'Brazil'
    GROUP BY
        f.id_cliente
    ORDER BY
        f.id_cliente;


    
SELECT * FROM Faturas_Brasil
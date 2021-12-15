#Crie uma view chamada FATURAS_NACIONAIS. A view deve ter as seguintes colunas: id da fatura, data da fatura, id do cliente, 
#nome do cliente, sobrenome do cliente e total da fatura, e deve incluir apenas faturas do Brasil (Brazil).
# Em seguida, execute SELECT * FROM FATURAS_NACIONAIS. Quantos registros a consulta retorna?
CREATE OR REPLACE VIEW FATURAS_NACIONAIS
AS
    SELECT
        f.id,
        f.data_fatura,
        cli.id as cliente_id,
        cli.nome,
        cli.sobrenome,
        f.valor_total
    FROM faturas f
    JOIN clientes cli
        ON f.id_cliente = cli.id
    WHERE (f.pais_cobranca = 'Argentina' or f.pais_cobranca = 'Argentina');
    
    SELECT * FROM FATURAS_NACIONAIS
#Gere um relatório que mostre por mês o valor das locações e a quantidade de locações para o ano de 2005.
SELECT 
    COUNT(loc.locacao_id) AS 'QUANTIDADE LOCACOES', 
        EXTRACT(MONTH FROM loc.data_locacao) AS Mes_locacao,
        SUM(pag.valor) as total
FROM locacao AS loc
INNER JOIN pagamento as pag
    ON loc.cliente_id = pag.cliente_id
WHERE
    EXTRACT(YEAR FROM loc.data_locacao) = 2005
GROUP BY
    EXTRACT(MONTH FROM loc.data_locacao);
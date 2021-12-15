-- 3 Selecione o nome das cancoes (tabela cancoes) e o tipo de arquivo (tabela tipos_de_arquivos) 
#e exiba o nome da canção e o tipo ordenado pelo id da canção.
SELECT c.id, c.nome, c.id_tipo_de_arquivo, tp.id, tp.nome
FROM cancoes AS c
INNER JOIN tipos_de_arquivo AS tp
ON c.id_tipo_de_arquivo = tp.id
ORDER BY c.id ASC


# Joins #3 - Faça uma consulta que retorne o nome das músicas e o tipo de arquivo "MPEG audio file".
# Qual o nome da músca que aparece na posiÇÃO 4? resposta Inject The Venom

SELECT c.id as 'codigo da canção', c.id_tipo_de_arquivo ,c.nome, tp.nome,tp.id
FROM cancoes AS c
INNER JOIN tipos_de_arquivo AS tp
   ON tp.id = c.id_tipo_de_arquivo
where tp.nome = 'MPEG audio file'


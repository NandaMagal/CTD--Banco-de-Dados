#Obtenha uma lista que inclua nome, sobrenome e e-mail dos clientes inativos. 
#Use Alias para exibir os nomes das colunas com a primeira letra maiúscula.
SELECT cliente_id,nome AS 'Nome',sobrenome as 'Sobrenome',email as 'Email', endereco_id as 'Endereço Id'
FROM cliente
WHERE ativo = 0

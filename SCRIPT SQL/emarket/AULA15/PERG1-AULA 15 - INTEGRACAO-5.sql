#VERIFICANDO BD EMARKET
#1)LISTE OS CLIENTES QUE FIZERAM COMPRAS DURANTE 1996.
#A LISTA DEVE CONTER AS SEGUINTES COLUNAS: NOME E SOBRENOME ; O TÍTULO É TODOD MAIÚSCULO;
SELECT c.ClienteID, c.Empresa,c.Titulo AS TITULO, fat.ClienteID, fat.DataFatura,fat.DataRegistro
FROM clientes as c
INNER JOIN faturas AS fat
ON c.ClienteID = fat.ClienteID
having fat.DataFatura >= '1996-01-01' and fat.DataRegistro <='1996-12-31'

#25) Na tabela empregados, o empregado que faz aniversário em 12 de setembro de 1984 é: *
select nome,sobrenome,data_nascimento
from empregados
where data_nascimento = '1984-09-12'
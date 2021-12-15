#Você deseja enviar um e-mail a todos os clientes que estão inativos. Em outras palavras, Ativo = 0.
# Para quantos clientes iremos enviar?
select count(cliente_id), ativo
from cliente
where ativo = 0
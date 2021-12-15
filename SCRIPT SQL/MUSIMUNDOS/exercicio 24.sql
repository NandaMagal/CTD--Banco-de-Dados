
#24) Liste o gênero e a quantidade de canções por gênero. O Gênero que possui 81 canções cadastradas é: *
select count(g.id), g.nome
 from generos  as g
 inner join cancoes as c
 on  g.id =c.id_genero
 group by g.nome


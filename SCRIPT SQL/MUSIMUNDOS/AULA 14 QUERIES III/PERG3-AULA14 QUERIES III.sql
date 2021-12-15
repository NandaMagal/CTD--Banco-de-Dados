#Joins #2 -Faça uma consulta ao nosso banco de dados que nos traga o título do álbum e o autor, para saber se o 
#que estamos vendendo está correto.
#Qual o título do álbum que aparece na posição número 10?

SELECT a.id as 'codigo do album', a.id_artista , a.titulo,art.nome
FROM albuns AS a
INNER JOIN  artistas AS art
   ON art.id = a.id_artista

-- 1 Importe a base de dados. Clique aqui para baixar.
-- 2 Liste as músicas que possuem a letra "z" no título.

-- SELECT idcancao,titulo
-- FROM cancao
-- WHERE titulo LIKE '%Z%'


-- 3 Liste as músicas que têm a letra "a" como segundo caractere e a letra "s" como último caractere.

SELECT idcancao,titulo
FROM cancao
WHERE titulo LIKE '_a%s'

-- 4) Mostre a lista de reprodução que contém mais músicas, renomeando as colunas, colocando em maiúscula a primeira letra, 
-- os acentos correspondentes e adicionando os espaços entre as palavras.

SELECT idPlaylist AS 'Id Playlist' ,titulo as 'Título', qtdcancoes as 'Quantidade de Canções'
FROM playlist
order by qtdcancoes desc
limit 1;

-- 5) Em outro momento, obtenha uma lista com os 5 usuários mais jovens, a partir dos próximos 10 registros.
SELECT idUsuario,Data_nac,Nomeusuario
FROM usuario
ORDER BY Data_nac ASC
LIMIT 5
OFFSET 10

#6Liste as 5 músicas com mais reproduções, em ordem decrescente.
SELECT idcancao,titulo,qtdreproducao
FROM cancao
order by qtdreproducao DESC
LIMIT 5



#7)#Gere um relatório de todos os álbuns em ordem alfabética.
SELECT idAlbum,titulo
FROM album
ORDER BY titulo ASC;

#8)#Liste todos os álbuns que não possuem imagem, organizados em ordem alfabética.
SELECT idAlbum,titulo,imagemcapa
FROM album
WHERE imagemcapa <> 'NULL'
ORDER BY titulo ASC


#9) Insira um novo usuário com os seguintes dados (leve em consideração os relacionamentos):
#nomeusuario: novousuariodespotify@gmail.com
#Nome e sobrenome: Elmer Santos 
#password: S4321m
#Data de nacimiento: 15/11/1991
#Sexo: Masculino
#Código Postal: B4129ATF
#País: Brasil

INSERT INTO usuario ( Nomeusuario, NomeCompleto, Data_nac, sexo, Cod, Pais_idPais)
 VALUES ( `Elmer Santos`, `Elmer Santos `, `1991-11-15`,`Masculino`, `B4129ATF`,  `Brasil`)

#10.  Exclua todas as músicas do gênero "pop".

delete from genero where Genero = 'pop'

#11.   Edite todos os artistas que não possuem uma imagem carregada e carregue para eles o texto 
#"Imagem em falta" na coluna de imagens.


UPDATE artista SET
imagem = 'Imagem em falta'
WHERE imagem <>  NULL

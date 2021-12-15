#Crie uma view chamada LATINOS com informações sobre os artistas com seus álbuns e músicas. A view deve ter as seguintes colunas: 
#nome do artista, título do álbum, nome da música e deve incluir apenas as músicas do gênero 'latino'. Faça uma seleção na visualização 
#LATINOS ordenada por nome de artista e música. 
#Qual é o nome da segunda música que aparece no resultado?

CREATE OR REPLACE VIEW LATINOS3
AS
    SELECT
        a.nome as artista,
        ab.titulo as album,
        can.nome as musica
    FROM artistas AS a
    INNER JOIN albuns AS ab
        ON a.id = ab.id_artista
    INNER JOIN cancoes AS can
        ON ab.id = can.id_album
    INNER JOIN generos as gen
        ON can.id_genero = gen.id
    WHERE id_genero = 07
    ORDER BY
        a.nome,
        musica;
    
    select * from LATINOS3;
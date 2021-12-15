2) Empregados por cidade

Crie uma SP que leva o nome de uma cidade e lista os funcionários dessa cidade
Invoque a SP para listar os empregados de Seattle.
DELIMITER $$
CREATE PROCEDURE  EMP_CIDADES8
(
in nome_pais VARCHAR(30),
IN nome_cidade VARCHAR(30)
)
BEGIN
SELECT Nome,Sobrenome,Telefone
FROM empregados
WHERE Cidade= nome_cidade or Pais=nome_pais ;
END $$
DELIMITER ;

CALL  EMP_CIDADES8 ('NULL', 'Seattle' );
CALL EMP_CIDADES8 ('USA','');
select Pais , cidade from empregados;
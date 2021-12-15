#5) Vendas com desconto

#Crie uma SP que receba uma porcentagem e lista os nomes dos produtos que foram vendidos com desconto igual ou superior 
#ao valor indicado, indicando, também,  o nome do cliente a quem foi vendido.
#Liste as informações dos produtos que foram vendidos com um desconto superior a 10%.

DELIMITER $
CREATE PROCEDURE vendas_desconto5
(
IN desconto_sugerido float
)
begin
SELECT
det.Desconto as Desconto_aplicado,
det.FaturaId as Fatura,
det.ProdutoID as Produto,
 CONCAT('produtos com desconto superior ', desconto_sugerido) as total_desconto_superior
FROM detalhefatura
inner join faturas
on f.FaturaId=detalhe.FaturaId
INNER JOIN produtos
ON  p.ProdutoID= det.FaturaId
inner join clientes
on c.ClienteID = f.ClienteID
where  det.Desconto>= desconto_sugerido;

END $
DELIMITER ;

CALL vendas_desconto5(10);

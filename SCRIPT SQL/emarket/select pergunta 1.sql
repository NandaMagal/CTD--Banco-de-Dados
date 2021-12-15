-- Para cada empresa de correio, calcule o transporte total. Inclua todas as empresas de correio,
-- mesmo que não tenham realizado nenhuma operação.
SELECT 
	c.Empresa,c.CorreioID, f.FormaEnvio,
	sum(IFNULL(f.transporte,0)) as total
 FROM correios AS c
 left join faturas as f
	on c.CorreioID = f.FormaEnvio
group by c.CorreioID
#Consultas

#1. Para cada empresa de correio, calcule o transporte total. Inclua todas as empresas de correio,
 #mesmo que não tenham realizado nenhuma operação.
 
 SELECT cor.Empresa,cor.CorreioID,fat.FormaEnvio,fat.FaturaId, fat.ClienteID
 -- SUM (IF NULL (fat.Transporte,0) AS TOTAL
 FROM correios AS cor
 LEFT JOIN faturas AS fat
 on cor.CorreioID = fat.FormaEnvio
 group by cor.CorreioID;



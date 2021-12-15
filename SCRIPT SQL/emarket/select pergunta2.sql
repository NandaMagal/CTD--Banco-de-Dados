-- Liste as informações de contato (ou, endereço, etc.) dos clientes que 
-- não fizeram compras. Exiba as informações no formato considerado mais adequado. Por exemplo: <endereço> (CP: < CEP>) 
SELECT 
	CONTACT ('SR/SRA', c.contato) as nome ,
   	CONTACT ('SR/SRA', c.contato) as nome ,
from clientes as c
LEFT JOIN FATURAS AS f
	on c.ClientesID
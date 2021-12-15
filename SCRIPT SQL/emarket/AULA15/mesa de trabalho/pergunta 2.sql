#2. Liste as informações de contato (ou, endereço, etc.) dos clientes que não fizeram compras. 
#Exiba as informações no formato considerado mais adequado. Por exemplo: <endereço> (CP: < CEP>) 
SELECT *
FROM clientes as c
left join faturas as fat
on c.ClienteID=fat.ClienteID
where fat.ClienteID is null;

/* Valor máximo, minimo e valor total de ingressos comprados */
select MAX(i.valor) as 'Valor Maximo Comprado', MIN(i.valor) as 'Valor Minimo Comprado', sum(i.valor) as 'Valor total'
from ingresso i join ingresso_comprado ic
	 on ic.codigoIngresso = i.codigo
group by 'Valor', 'Valor Minimo Comprado', 'Valor total';

/* Quantidade de ingressos comprados para cada sessão, agrupados por idsessão */
select s.id, count(*) as 'Ingressos comprados'
from ingresso_comprado ic join ingresso i
     on ic.codigoIngresso = i.codigo
     join sessao s 
     on s.id = i.idSessao
group by s.id;

/* Quantidade de ingressos comprados que não são do filme Os Vingadores com subconsulta */
select count(*) as 'Quantidade de ingressos comprados que não são do filme Os Vingadores'
from ingresso_comprado ic join ingresso i
	 on ic.codigoIngresso = i.codigo
     join sessao s on s.id = i.idsessao
     join filme f on f.id = s.idfilme
where f.titulo not in  
(select f.titulo
from ingresso_comprado ic join ingresso i
	 on ic.codigoIngresso = i.codigo
     join sessao s on s.id = i.idsessao
     join filme f on f.id = s.idfilme
where f.titulo = 'Os Vingadores');

/* Nome dos clientes com StoredProcedure */
Delimiter $$
create procedure nomeClientes()
begin
	select nomeCompleto
    from cliente;
end $$
delimiter ;

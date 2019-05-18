/* Quantidade de poltronas por sessão */
select se.id as 'idSessão', count(*)
from sessao se join sala sa
     on se.idSala = sa.idSala
     join poltrona p
     on p.idSala = sa.idSala
group by se.id;

/* Quantidade de poltronas por salas (exibindo os números) */
select s.idSala, s.num, count(*)
from sala s join poltrona p 
     on s.idSala = p.idSala
group by s.idSala;

/* Quantidade de poltronas por salas (exibindo os números das salas e os nomes dos cinemas) */
select s.idSala, c.nome, s.num, count(*)
from sala s join poltrona p 
     on s.idSala = p.idSala
     join cinema c
     on c.cnpj = s.cnpjCinema
group by s.idSala;

/* Valor máximo, minimo e total de ingressos comprados */
select MAX(i.valor) as 'Valor Maximo Comprado', MIN(i.valor) as 'Valor Minimo Comprado', sum(i.valor) as 'Valor total'
from ingresso i join ingresso_comprado ic
	 on ic.codigoIngresso = i.codigo
group by 'Valor', 'Valor Minimo Comprado', 'Valor total'


/* Informar nome do cliente, codigo do ingresso, id sessao, data e hora do ingresso comprado */
select count(*) as 'q', c.nomeCompleto as 'Nome', ic.codigoIngresso as 'Codigo Ingresso', i.idSessao as 'Sessao', ic.DataHora as 'Data e Hora'
from cliente c join ingresso_comprado ic
	 on c.cpf = ic.cpfCliente
     join ingresso i 
     on ic.codigoIngresso = i.codigo
group by c.nomecompleto


/* Qtd de clientes que não irão assistir ao filme dos Vingadores com subconsulta */

select count(*) as 'Quantidade de clientes que não irão assistir Os Vingadores'
from ingresso_comprado ic join ingresso i
	 on ic.codigoIngresso = i.codigo
     join sessao s on s.id = i.idsessao
     join filme f on f.id = s.idfilme
where f.titulo <> 

(select f.titulo
from ingresso_comprado ic join ingresso i
	 on ic.codigoIngresso = i.codigo
     join sessao s on s.id = i.idsessao
     join filme f on f.id = s.idfilme
where f.titulo = 'Os Vingadores')
     
     
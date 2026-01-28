--1
alter table veterinario
alter column nome type varchar(100);

--2
insert into dono (nome, cpf, status) values
('Alice Guimarães', '12345678911', true),
('Bernardo Vasques', '11122233300', true),
('Jeferson Aguiar', '00112255447', true);

insert into veterinario (nome, crmv, especializacao, jornada) values
('Júlia Vieira', 'CRMV-RJ123456', 'Clínico', 4),
('Wilson Marques', 'CRMV-RJ112233', 'Cirurgião', 4),
('Valéria Andrade', 'CRMV-RJ012344', 'Dermato', 6);
--3
insert into endereco (cep, logradouro, localidade, uf, bairro, numero, complemento, referencia, principal, dono) values
('25650320', 'Rua Pará', 'Petrópolis', 'RJ', 'Quitandinha', 0, 'Lote 55', 'Em frente ao mercado Xodó', true, 1),
('25620321', 'Rua do Alemão', 'Petrópolis', 'RJ', 'Centro', 10, null, null, true, 2),
('25600000', 'Rua das Flores', 'Petrópolis', 'RJ', 'Bingen', 1, null, null, true, 3);
--3
insert into telefone(numero, dono) values
('(24)98243-9943', 1),
('(24)98456-9966', 2),
('(24)98520-3201', 3);
--4
insert into animal(nome, especie, raca, idade, infos_medicas, status, dono) values
('Flor', 'gato', 'Não declarado', 1, null, true, 1),
('Mia', 'gato', 'Não declarado', 2, null, true, 1),
('Laila', 'gato', 'Não declarado', 8, null, true, 1);
--5
insert into consulta(data_hora, animal) values
('2026-01-30 10:00', 1),
('2025-12-01 18:00', 3),
('2026-02-20 09:30', 1);
--6
insert into veterinario_consulta(id_veterinario, id_consulta, obs_medicas) values
(1, 1, 'primeira consulta, vacinação'),
(2, 2, 'acompanhamento de tratamento'),
(1, 3, 'retorno do pet');

--3
update animal set status = false where id = 2

--4
delete from veterinario_consulta where id_consulta = 1;
delete from veterinario_consulta where id_veterinario = 2;
select * from veterinario_consulta

--5
update consulta set data_hora = '2026-12-12 10:00' where id = 2;

--6
create view relatorio_consulta as
select 
v.nome as "Nome do veterinário",
d.nome as "Nome do Dono",
t.numero,
c.data_hora,
vc.obs_medicas
from dono d 
join telefone t on t.dono = d.id 
join animal a on a.dono = d.id 
join consulta c on c.animal = a.id 
join veterinario_consulta vc on vc.id_consulta = c.id 
join veterinario v on v.id = vc.id_veterinario;

--7
select * from consulta c
join veterinario_consulta vc on vc.id_consulta = c.id 
where vc.id_veterinario = :idVeterinario;

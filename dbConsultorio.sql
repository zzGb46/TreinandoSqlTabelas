drop database dbConsultorio;
 
create database dbConsultorio;
 
use dbConsultorio;
 
create table tbMedicos(
    idMedico int not null auto_increment,
    nome varchar(100),
    telefone char(10) unique,
    primary key(idMedico)
);


 
create table tbPacientes(
    idPaciente int not null auto_increment,
    nome varchar(100),
    telefone char(10) unique,
    convenio varchar(100),
    primary key(idPaciente)
);
 
create table tbReceitaMedica(
    idReceitaMedica int not null auto_increment,
    descricao varchar(100),
    primary key(idReceitaMedica)
);
 
create table tbConsultas(
    idConsulta int not null auto_increment,
    data datetime,
    idMedico int not null,
    idPaciente int not null,
    idReceitaMedica int not null,
    primary key(idConsulta),
    foreign key(idMedico) references tbMedicos(idMedico),
    foreign key(idPaciente) references tbPacientes(idPaciente),
    foreign key(idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

--  select tbmedicos.nome, tbpacientes.nome, tbReceitaMedica.descricao from tbmedicos inner join tbconsultas on tbconsultas.idMedico = tbmedicos.idMedico
--  inner join tbpacientes on tbconsultas.idPaciente = tbpacientes.idPaciente 
--  inner join tbReceitaMedica on tbconsultas.idReceitaMedica = tbReceitaMedica.idReceitaMedica; 


-- select tbmedicos.nome from tbconsultas inner join tbmedicos on idConsulta= tbmedicos.idConsulta;

 
-- desc tbMedicos;
-- desc tbPacientes;
-- desc tbReceitaMedica;
-- desc tbConsultas;
-- INSERÇÕES tbmedico
INSERT INTO
    tbMedicos(nome, telefone)
VALUES
    ("Gabriel Ventura", "91651-6413");
 
INSERT INTO
    tbMedicos(nome, telefone)
VALUES
    ("Roberto da Silva", "99442-2345");
 
INSERT INTO
    tbMedicos(nome, telefone)
VALUES
    ("Matias Ribeiro", "99234-4234");

    INSERT INTO
    tbMedicos(nome, telefone)
VALUES
    ("Mary Silva", "99234-4567");
 
-- INSERÇÃO tbPacientes
INSERT INTO
    tbPacientes(nome, telefone, convenio)
VALUES
    ("Jubileu da Silva", "92345-6413", "Porto Seguro");
 
INSERT INTO
    tbPacientes(nome, telefone, convenio)
VALUES
    ("Ana Souza Morares", "99999-6413", "Unimed");
 
INSERT INTO
    tbPacientes(nome, telefone, convenio)
VALUES
    ("Creuza Soares", "88888-6413", "Porto Seguro");
 
INSERT INTO
    tbPacientes(nome, telefone, convenio)
VALUES
    ("Fabiano dos Santos", "77777-6413", "MedicosBR");
 
INSERT INTO
    tbPacientes(nome, telefone, convenio)
VALUES
    ("Jessica Morais", "66666-6413", "Unimed");
 
INSERT INTO
    tbReceitaMedica(descricao)
VALUES
    (
        "Descricao da receita medica do paciente tal do tal etc tal"
    );
 
INSERT INTO
    tbReceitaMedica(descricao)
VALUES
    ("Correr 24 horas por dia por 7 dias seguidos ");
 
INSERT INTO
    tbReceitaMedica(descricao)
VALUES
    (
        "Parar de comer para sempre e ficar sem beber agua por 1 ano"
    );
 
INSERT INTO
    tbReceitaMedica(descricao)
VALUES
    ("Fazer caminhada todos dias e tomar rivotril");
 
INSERT INTO
    tbReceitaMedica(descricao)
VALUES
    ("Tomar 5L de agua todos dias");
 
INSERT INTO
    tbConsultas(data, idMedico, idPaciente, idReceitaMedica) VALUE("2024-06-18", 3, 4, 3);
 
INSERT INTO
    tbConsultas(data, idMedico, idPaciente, idReceitaMedica) VALUE("2024-06-19", 2, 2, 5);

INSERT INTO
    tbConsultas(data, idMedico, idPaciente, idReceitaMedica) VALUE("2024-06-19",4 , 3, 5);

INSERT INTO
    tbConsultas(data, idMedico, idPaciente, idReceitaMedica) VALUE("2024-06-19", 1, 1, 5);
 
SELECT
    *
FROM
    tbmedicos;
 
SELECT
    *
FROM
    tbPacientes;
 
SELECT
    *
FROM
    tbReceitaMedica;
 
SELECT
    * 
FROM tbConsultas;


inner join 

SELECT
    *
FROM
    tbConsultas;
--  source C:\Dfs03\dbConsultorio.sql


SELECT
    pac.nome AS "Nome paciente",
    med.nome AS "Nome medico",
    rec.descricao AS "descricao receita"
FROM
    tbConsultas AS con
    INNER JOIN tbPacientes AS pac ON con.idPaciente = pac.idPaciente
    INNER JOIN tbmedicos AS med ON con.idMedico = med.idMedico
    INNER JOIN tbReceitaMedica AS rec ON con.idReceitaMedica = rec.idReceitaMedica
-- WHERE med.nome LIKE '%n';


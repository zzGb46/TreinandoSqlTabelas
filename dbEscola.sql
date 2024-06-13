drop database dbEscola;
create database dbEscola;
use dbEscola;

create table tbAlunos(
idAluno int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf char(14) not null unique,
sexo char(1) default 'F' check (sexo in('f','m')),
idade int default 0 check(idade < 0),
primary key(idAluno)
);



create table tbTurma(
    idTurma int not null,
    nome varchar(100) not null,
    primary key(idTurma)
);


create table tbFuncionarios(
idFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
telefone char(9) not null,
cpf char(14) not null unique,
primary key(idFunc)
);

create table tbProfessores(
re char(7) ,
idFunc int not null,
primary key(re),
foreign key(idFunc) references tbfuncionarios(idFunc)

);

create table tbCursos(
 idCurso int not null auto_increment,
 re char(7) not null,
 nome varchar(100) not null,
data date not null,
hora time not null,
primary key(idCurso),
foreign key(re) references tbProfessores(re) 
);

create table tbUsuarios(
idUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(30) not null,
idFunc int not null,
primary key(idUsu),
foreign key(idFunc) references tbFuncionarios(idFunc)
);


create table tbMatricula(
idmatr char(14) not null,
idCurso int not null,
idTurma int not null,
idUsu int not null,
idAluno int not null,
data date,
hora time,
primary key(idmatr),
foreign key(idCurso) references tbCursos(idCurso),
foreign key(idTurma) references tbTurma(idTurma),
foreign key(idUsu) references tbUsuarios(idUsu),
foreign key(idAluno) references tbAlunos(idAluno)
);



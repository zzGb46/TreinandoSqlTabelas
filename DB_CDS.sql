drop database DB_CDS;
create database DB_CDS;
use DB_CDS;

create table tbArtistas(
COD_ART int not null auto_increment,
NOME_ART varchar(100) unique,
primary key(COD_ART)
);

create table tbGravadora(
COD_GRAV int not null auto_increment,
NOME_GRAV varchar(50) not null unique,
primary key(COD_GRAV)
);

create table tbCategorias(
COD_CAT int not null auto_increment,
NOME_CAT varchar(50) not null unique,
primary key(COD_CAT)
);

create table tbEstados(
SIGLA_EST char(2) not null,
NOME_EST varchar(50) not null unique,
primary key(SIGLA_EST)
);

create table tbCidades(
COD_CID int not null auto_increment,
SIGLA_EST char(2) not null,
NOME_CID varchar(50) not null,
primary key(COD_CID),
foreign key(SIGLA_EST) references tbEstados(SIGLA_EST)
);

create table tbClientes(
    COD_CLI int not null auto_increment,
    COD_CID int not null,
    NOME_CLI varchar(50) not null,
    END_CLI varchar(100) not null,
    RENDA_CLI decimal(9,2) not null default 0 check (RENDA_CLI >=0),
    SEXO_CLI char(1) default 'F' check (SEXO_CLI in('F','M')),
    primary key(COD_CLI),
    foreign key(COD_CID) references tbCidades(COD_CID)
);

create table tbConjuge(
    COD_CONJ int not null auto_increment,
    NOME_CONJ varchar(50) not null,
    RENDA_CONJ decimal(9,2) not null default 0,
    SEXO_CLI char(1) not null default 'f' check(SEXO_CLI in('f','m')),
    primary key(COD_CONJ)
);

create table tbFuncionarios(
    COD_FUNC int not null auto_increment,
    NOME_FUNC varchar(50) not null,
    END_FUNC varchar(100) not null,
    SAL_FUNC decimal(9,2) not null default 0 check(SAL_FUNC >=0),
    SEXO_FUNC char(1) not null default 'f' check(SEXO_FUNC in('f','m')),
    primary key(COD_FUNC) 
);

create table tbDependentes(
    COD_DEP int not null auto_increment,
    COD_FUNC int not null,
    NOME_DEP varchar(100) not null,
    SEXO_DEP char(1) not null default 'f' check(SEXO_DEP in('f','m')),
    primary key(COD_DEP),
    foreign key(COD_FUNC) references tbFuncionarios(COD_FUNC)
    );

create table tbTitulos(
COD_TIT int not null auto_increment,
COD_CAT int not null,
COD_GRAV int not null,
NOME_CD varchar(50) not null unique,
VAL_CD decimal(9,2) not null check(VAL_CD > 0),
QTD_ESTQ int not null check(QTD_ESTQ >=0),
    primary key(COD_TIT),
    foreign key(COD_CAT) references tbCategorias(COD_CAT),
    foreign key(COD_GRAV) references tbGravadora(COD_GRAV)
);

create table tbPedidos(
    NUM_PED int not null auto_increment,
    COD_CLI int not null,
    COD_FUNC int not null,
    DATA_PED DATETIME not null,
    VAL_PED decimal(9,2) not null default 0 check(VAL_PED >=0),
    primary key(NUM_PED),
    foreign key(COD_CLI) references tbClientes(COD_CLI),
    foreign key(COD_FUNC) references tbFuncionarios(COD_FUNC)
);

create table tbTitulos_Pedido(
    NUM_PED int not null,
    COD_TIT int not null,
    QTD_CD int not null check(QTD_CD >=1),
    VAL_CD decimal(9,2) not null check(VAL_CD >0),
    foreign key(NUM_PED) references tbPedidos(NUM_PED),
    foreign key(COD_TIT) references tbTitulos(COD_TIT)

);

create table tbTitulos_Artista(
    COD_TIT int not null,
    COD_ART int not null,
    foreign key(COD_TIT) 
);
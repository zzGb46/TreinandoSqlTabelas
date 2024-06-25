DROP DATABASE IF EXISTS db_cds;
 
-- Criando db
CREATE DATABASE IF NOT EXISTS db_cds;
 
-- Acessando db
USE db_cds;
 
-- Criando as tabelas
-- tabela artistas
CREATE TABLE tbArtistas (
    cod_art INT NOT NULL AUTO_INCREMENT,
    nome_art VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY(cod_art)
);
 
-- tabela gravadoras
CREATE TABLE tbGravadoras (
    cod_grav INT NOT NULL AUTO_INCREMENT,
    nome_grav VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(cod_grav)
);
 
-- tabela categorias
CREATE TABLE tbCategorias (
    cod_cat INT NOT NULL AUTO_INCREMENT,
    nome_cat VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(cod_cat)
);
 
-- tabela estados
CREATE TABLE tbEstados (
    sigla_est CHAR(2) NOT NULL,
    nome_est VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(sigla_est)
);
 
-- tabela cidades
CREATE TABLE tbCidades (
    cod_cid INT NOT NULL AUTO_INCREMENT,
    nome_cid VARCHAR(50) NOT NULL,
    sigla_est CHAR(2) NOT NULL,
    PRIMARY KEY(cod_cid),
    FOREIGN KEY(sigla_est) REFERENCES tbEstados(sigla_est)
);
 
-- tabela clientes
CREATE TABLE tbClientes (
    cod_cli INT NOT NULL AUTO_INCREMENT,
    nome_cli VARCHAR(50) NOT NULL,
    end_cli VARCHAR(100) NOT NULL,
    renda_cli DECIMAL(9, 2) NOT NULL DEFAULT 0 CHECK (renda_cli >= 0),
    sexo_cli CHAR(1) NOT NULL DEFAULT 'F' CHECK (sexo_cli IN ('F', 'M')),
    cod_cid INT NOT NULL,
    PRIMARY KEY(cod_cli),
    FOREIGN KEY(cod_cid) REFERENCES tbCidades(cod_cid)
);
 
-- tabela conjuge
CREATE TABLE tbConjuge (
    cod_cli INT NOT NULL,
    nome_conj VARCHAR(50) NOT NULL,
    renda_conj DECIMAL(9, 2) NOT NULL DEFAULT 0 CHECK (renda_conj >= 0),
    sexo_conj CHAR(1) NOT NULL DEFAULT 'F' CHECK (sexo_conj IN ('F', 'M')),
    PRIMARY KEY(cod_cli),
    FOREIGN KEY(cod_cli) REFERENCES tbClientes(cod_cli)
);
 
-- tabela funcionarios
CREATE TABLE tbFuncionarios (
    cod_func INT NOT NULL AUTO_INCREMENT,
    nome_func VARCHAR(50) NOT NULL,
    end_func VARCHAR(100) NOT NULL,
    sal_func DECIMAL(9, 2) NOT NULL DEFAULT 0 CHECK (sal_func >= 0),
    sexo_func CHAR(1) NOT NULL DEFAULT 'F' CHECK (sexo_func IN ('F', 'M')),
    PRIMARY KEY(cod_func)
);
 
-- tabela dependentes
CREATE TABLE tbDependentes (
    cod_dep INT NOT NULL AUTO_INCREMENT,
    nome_dep VARCHAR(100) NOT NULL,
    sexo_dep CHAR(1) NOT NULL DEFAULT 'F' CHECK (sexo_dep IN ('F', 'M')),
    cod_func INT NOT NULL,
    PRIMARY KEY(cod_dep),
    FOREIGN KEY(cod_func) REFERENCES tbFuncionarios(cod_func)
);
 
-- tabela titulos
CREATE TABLE tbTitulos (
    cod_tit INT NOT NULL AUTO_INCREMENT,
    nome_cd VARCHAR(50) NOT NULL UNIQUE,
    val_cd DECIMAL(9, 2) NOT NULL CHECK (val_cd > 0),
    qtd_estq INT NOT NULL CHECK (qtd_estq >= 0),
    cod_cat INT NOT NULL,
    cod_grav INT NOT NULL,
    PRIMARY KEY(cod_tit),
    FOREIGN KEY(cod_cat) REFERENCES tbCategorias(cod_cat),
    FOREIGN KEY(cod_grav) REFERENCES tbGravadoras(cod_grav)
);
 
-- tabela pedidos
CREATE TABLE tbPedidos (
    num_ped INT NOT NULL AUTO_INCREMENT,
    data_ped DATE NOT NULL,
    val_ped DECIMAL(9, 2) NOT NULL DEFAULT 0 CHECK (val_ped >= 0),
    cod_cli INT NOT NULL,
    cod_func INT NOT NULL,
    PRIMARY KEY(num_ped),
    FOREIGN KEY(cod_cli) REFERENCES tbClientes(cod_cli),
    FOREIGN KEY(cod_func) REFERENCES tbFuncionarios(cod_func)
);
 
-- tabela pedido
CREATE TABLE tbPedido (
    num_ped INT NOT NULL,
    cod_tit INT NOT NULL,
    qtd_cd INT NOT NULL CHECK (qtd_cd >= 1),
    val_cd DECIMAL(9, 2) NOT NULL CHECK (val_cd > 0),
    PRIMARY KEY(num_ped, cod_tit),
    FOREIGN KEY(num_ped) REFERENCES tbPedidos(num_ped),
    FOREIGN KEY(cod_tit) REFERENCES tbTitulos(cod_tit)
);



 
-- tabela titulos_artista
CREATE TABLE tbTitulos_artista (
    cod_tit INT NOT NULL,
    cod_art INT NOT NULL,
    PRIMARY KEY(cod_tit, cod_art),
    FOREIGN KEY(cod_tit) REFERENCES tbTitulos(cod_tit),
    FOREIGN KEY(cod_art) REFERENCES tbArtistas(cod_art)
);
 



-- INSERINDO DADOS NAS TABELAS
--
-- tbArtistas
INSERT INTO
    tbArtistas(nome_art)
VALUES
    ('Marisa Monte'),
    ('Gilberto Gil'),
    ('Caetano Veloso'),
    ('Milton Nascimento'),
    ('Legião Urbana'),
    ('The Beatles'),
    ('Rita Lee');
 
-- tbGravadoras
INSERT INTO
    tbGravadoras(nome_grav)
VALUES
    ('Polygram'),
    ('Emi'),
    ('Som Livre'),
    ('Som Music');
 
-- tbCategorias
INSERT INTO
    tbCategorias(nome_cat)
VALUES
    ('MPB'),
    ('Trilha Sonora'),
    ('Rock Internacional'),
    ('Rock Nacional');
 
-- tbEstados
INSERT INTO
    tbEstados(sigla_est, nome_est)
VALUES
    ('SP', 'São Paulo'),
    ('MG', 'Minas Gerais'),
    ('RJ', 'Rio de Janeiro'),
    ('ES', 'Espirito Santo');
 
-- tbCidades
INSERT INTO
    tbCidades(sigla_est, nome_cid)
VALUES
    ('SP', 'São Paulo'),
    ('SP', 'Sorocaba'),
    ('SP', 'Jundiaí'),
    ('SP', 'Americana'),
    ('SP', 'Araraquara'),
    ('MG', 'Ouro Preto'),
    ('ES', 'Cachoeira do Itapemirim');
 
-- tbClientes
INSERT INTO
    tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli)
VALUES
    (1, 'José Nogueira', 'Rua A', 1500.00, 'M'),
    (1, 'Ângelo Pereira', 'Rua B', 2000.00, 'M'),
    (1, 'Além Mar Paranhos', 'Rua C', 1500.00, 'M'),
    (1, 'Catarina Souza', 'Rua D', 892.00, 'F'),
    (1, 'Vagner Costa', 'Rua E', 950.00, 'M'),
    (2, 'Antenor', 'Rua F', 1582.00, 'M'),
    (2, 'Maria Amélia', 'Rua G', 1152.00, 'F'),
    (2, 'Paulo Roberto Silva', 'Rua H', 3250.00, 'M'),
    (3, 'Fátima Souza', 'Rua I', 1632.00, 'F'),
    (3, 'Joel da Rocha', 'Rua J', 2000.00, 'M');
 
-- tbConjuge
INSERT INTO
    tbConjuge(cod_cli, nome_conj, renda_conj, sexo_conj)
VALUES
    (1, 'Carla Nogueira', 2500.00, 'F'),
    (2, 'Emilia Pereira', 5500.00, 'F'),
    (6, 'Altiva da Costa', 3000.00, 'F'),
    (7, 'Carlos', 3250.00, 'M');
 
-- tbFuncionarios
INSERT INTO
    tbFuncionarios(nome_func, end_func, sal_func, sexo_func)
VALUES
    ('Vânia Gabriela Pereira', 'Rua A', 2500.00, 'F'),
    ('Noberto Pereira da Silva', 'Rua B', 300.00, 'M'),
    ('Olavo Linhares', 'Rua C', 580.00, 'M'),
    ('Paula da Silva', 'Rua D', 3000.00, 'F'),
    ('Rolando Rocha', 'Rua E', 2000.00, 'M');
 
-- tbDependentes
INSERT INTO
    tbDependentes(cod_func, nome_dep, sexo_dep)
VALUES
    (1, 'Ana Pereira', 'F'),
    (1, 'Roberto Pereira', 'M'),
    (1, 'Celso Pereira', 'M'),
    (3, 'Brisa Linhares', 'F'),
    (3, 'Mari Sol Linhares', 'F'),
    (4, 'Sonia da Silva', 'F');
 
-- tbTitulos
INSERT INTO
    tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq)
VALUES
    (1, 1, 'Tribalistas', 30.00, 1500),
    (1, 2, 'Tropicália', 50.00, 500),
    (1, 1, 'Aquele Abraço', 50.00, 600),
    (1, 2, 'Refazenda', 60.00, 1000),
    (1, 3, 'Totalmente Demais', 50.00, 2000),
    (1, 3, 'Travessia', 55.00, 500),
    (1, 2, 'Courage', 55.00, 200),
    (4, 3, 'Legião Urbana', 20.00, 100),
    (3, 2, 'The Beatles', 30.00, 300),
    (4, 1, 'Rita Lee', 30.00, 500);
 
-- tbPedidos
INSERT INTO
    tbPedidos(cod_cli, cod_func, data_ped, val_ped)
VALUES
    (1, 2, '2002-05-02', 1500.00),
    (3, 4, '2002-05-02', 50.00),
    (4, 4, '2002-06-02', 100.00),
    (1, 4, '2003-02-02', 200.00),
    (7, 5, '2003-03-02', 300.00),
    (4, 4, '2003-03-02', 100.00),
    (5, 5, '2003-03-02', 50.00),
    (8, 2, '2003-03-02', 50.00),
    (2, 2, '2003-03-02', 2000.00),
    (7, 1, '2003-03-02', 3000.00);
 
-- tbTitulos_artista
INSERT INTO
    tbTitulos_artista(cod_tit, cod_art)
VALUES
    (1, 1),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 4),
    (7, 4),
    (8, 5),
    (9, 6),
    (10, 7);
 
-- tbTitulos_pedido
INSERT INTO
    tbPedido(num_ped, cod_tit, qtd_cd, val_cd)
VALUES
    (1, 1, 2, 30.00),
    (1, 2, 3, 20.00),
    (2, 1, 1, 50.00),
    (2, 2, 3, 30.00),
    (3, 1, 2, 40.00),
    (4, 2, 3, 20.00),
    (5, 1, 2, 25.00),
    (6, 2, 3, 30.00),
    (6, 3, 1, 35.00),
    (7, 4, 2, 55.00),
    (8, 1, 4, 60.00),
    (9, 2, 3, 15.00),
    (10, 7, 2, 15.00);
 
-- SELECIONE O NOME DOS CDS E O NOME DA GRAVADORA DE CADA CD
-- SELECT
--     grav.nome_grav AS 'Gravadora',
--     tit.nome_cd AS 'CD'
-- FROM
--     tbTitulos AS tit
--     INNER JOIN tbGravadoras grav ON tit.cod_grav = grav.cod_grav;
 
-- -- SELECIONE O NOME DOS CDS E O NOME DA CATEGORIA DE CADA CD
-- SELECT
--     tit.nome_cd AS 'CD',
--     cat.nome_cat AS 'Categoria'
-- FROM
--     tbTitulos AS tit
--     INNER JOIN tbCategorias cat ON tit.cod_grav = cat.cod_cat;
 
-- -- SELECIONE O NOME DOS CDS, O NOME DAS GRAVADORAS DE CADA CD E O NOME DA CATEGORIA DE CADA CD
-- SELECT
--     tit.nome_cd AS 'CD',
--     grav.nome_grav AS 'Gravadora',
--     cat.nome_cat AS 'Categoria'
-- FROM
--     tbTitulos AS tit
--     INNER JOIN tbCategorias cat ON tit.cod_grav = cat.cod_cat
--     INNER JOIN tbGravadoras grav ON tit.cod_grav = grav.cod_grav;
 
-- -- SELECIONE O NOME DOS CLIENTES E O TITULOS DOS CD VENDIDOS EM CADA PEDIDO QUE O CLIENTE FEZ
-- SELECT
--     cli.nome_cli AS 'Nome do Cliente',
--     tit.nome_cd AS 'Titulo do CD'
-- FROM
--     tbClientes AS cli
--     INNER JOIN tbPedidos AS ped ON cli.cod_cli = ped.cod_cli
--     INNER JOIN tbPedido AS pd ON ped.num_ped = pd.num_ped
--     INNER JOIN tbTitulos AS tit ON pd.cod_tit = tit.cod_tit;
 
-- -- SELECIONE O NOME DO FUNCIONARIO, NUMERO, DATA E VALOR DOS PEDIDOS QUE ESTE FUNCIONARIO REGISTROU,
-- -- ALÉM DO NOME DO CLIENTE QUE ESTÁ FAZENDO O PEDIDO
-- SELECT
--     f.nome_func AS 'Nome do Funcionario',
--     p.num_ped AS 'Numero do Pedido',
--     p.data_ped AS 'Data do Pedido',
--     p.val_ped AS 'Valor do Pedido',
--     c.nome_cli AS 'Nome do Cliente'
-- FROM
--     tbFuncionarios AS f
--     INNER JOIN tbPedidos AS p ON f.cod_func = p.cod_func
--     INNER JOIN tbClientes AS c ON p.cod_cli = c.cod_cli;
 
-- -- SELECIONE O NOME DOS FUNCIONARIOS E O NOME DE TODOS OS DEPENDENTES DE CADA FUNCIONARIO
-- SELECT
--     f.nome_func AS 'Funcionarios',
--     d.nome_dep AS 'Dependentes'
-- FROM
--     tbFuncionarios AS f
--     LEFT JOIN tbDependentes AS d ON f.cod_func = d.cod_func;
 
-- -- SELECIONE O NOME DOS CLIENTES E O NOME DOS CONJUGES DE CADA CLIENTE
-- SELECT
--     c.nome_cli AS 'Cliente',
--     cj.nome_conj AS 'Conjuge'
-- FROM
--     tbClientes AS c
--     LEFT JOIN tbConjuge AS cj ON c.cod_cli = cj.cod_cli;
 
-- -- SELECIONE O NOME DE TODOS CLIENTES. SE ESTES POSSUEM CONJUGES, MOSTRAR OS NOMES DE SEUS CONJUGES TAMBÉM
-- SELECT
--     c.nome_cli AS 'Cliente',
--     cj.nome_conj AS 'Conjuge'
-- FROM
--     tbClientes AS c
--     INNER JOIN tbConjuge AS cj ON c.cod_cli = cj.cod_cli;
 
-- -- SELECIONE NOME DO CLIENTE, NOME DO CONJUGE, NUMERO DO PEDIDO QUE CADA CLIENTE FEZ,
-- SELECT
--     c.nome_cli AS 'Nome do Cliente',
--     co.nome_conj AS 'Nome do Conjuge',
--     p.num_ped AS 'Numero do Pedido'
-- FROM
--     tbClientes AS c
--     LEFT JOIN tbConjuge AS co ON c.cod_cli = co.cod_cli
--     INNER JOIN tbPedidos AS p ON c.cod_cli = p.cod_cli;
 
-- -- VALOR DE CADA PEDIDO QUE CADA CLIENTE FEZ
-- -- E O CODIGO DO FUNCIONARIO QUE ATENDEU A CADA PEDIDO
-- SELECT
--     f.cod_func AS 'Cod do Funcionario',
--     p.val_ped AS 'Valor do Pedido'
-- FROM
--     tbFuncionarios AS f
--     INNER JOIN tbPedidos AS p ON f.cod_func = p.cod_func;
-- tem menu de contexto

 
DROP DATABASE PROJETO_NOVO;
CREATE DATABASE PROJETO_NOVO;
use PROJETO_NOVO;

CREATE TABLE FILES (
  ID varchar(255) NOT NULL PRIMARY KEY,
  FILENAME varchar(255) DEFAULT NULL,
    CONTENTLENGTH varchar(255) DEFAULT NULL,
    CONTENTTYPE varchar(255) DEFAULT NULL,
    URL varchar(255) DEFAULT NULL
 ) ;


CREATE TABLE aluguel (
  ID varchar(255) NOT NULL,
  IDFILME varchar(255) DEFAULT NULL,
  IDUSUARIO varchar(255) DEFAULT NULL,
  DTMOV datetime DEFAULT NULL,
  TIPO int(11) DEFAULT NULL,
  IDMOV varchar(255) DEFAULT NULL
) ;


INSERT INTO aluguel (ID, IDFILME, IDUSUARIO, DTMOV, TIPO, IDMOV) VALUES
('1', '1', '2', '2024-01-25 00:00:00', 0, NULL),
('10', '2', '2', '2024-10-02 00:00:00', 1, '9'),
('2', '1', '2', '2024-01-26 00:00:00', 1, '1'),
('3', '4', '3', '2024-01-24 00:00:00', 0, NULL),
('4', '4', '3', '2024-02-26 00:00:00', 1, '3'),
('5', '2', '1', '2024-01-10 00:00:00', 0, NULL),
('6', '2', '1', '2024-11-26 00:00:00', 1, '5'),
('7', '2', '1', '2024-08-30 00:00:00', 0, NULL),
('8', '2', '1', '2024-09-01 00:00:00', 1, '7'),
('9', '2', '2', '2024-10-01 00:00:00', 0, NULL);


CREATE TABLE filme (
  ID varchar(255) NOT NULL,
  NOME varchar(255) DEFAULT NULL,
  DURACAO int(11) DEFAULT NULL,
  SINOPSE text DEFAULT NULL,
  ANO int(11) DEFAULT NULL,
  IDGENERO varchar(255) DEFAULT NULL
) ;

INSERT INTO filme (ID, NOME, DURACAO, SINOPSE, ANO, IDGENERO) VALUES
('1', 'Risos na Casa Assombrada', 120, 'Uma família se muda para uma casa supostamente assombrada, mas as coisas ficam mais engraçadas do que assustadoras quando descobrem que os fantasmas são trapalhões.', 2019, '2'),
('2', 'Espetacular - Caçadores da Maldição Perdida', 90, 'Uma equipe de arqueólogos se aventura em uma selva perigosa em busca de um artefato lendário, enfrentando armadilhas mortais e rivais implacáveis.', 2019, '3'),
('3', 'Operação Resgate', 120, 'Um ex-agente secreto embarca em uma missão perigosa para resgatar seu filho sequestrado, enfrentando um cartel de drogas impiedoso e suas próprias memórias sombrias.', 2021, '3'),
('4', 'Missão Explosiva', 110, 'Uma equipe de mercenários é contratada para recuperar um artefato roubado de um bunker de alta segurança, desencadeando uma série de explosões espetaculares.', 2015, '3'),
('5', 'O Palhaço Assassino', 180, 'Em uma pequena cidade, um palhaço macabro começa a aterrorizar os habitantes, deixando um rastro de morte e loucura por onde passa.', 2001, '1'),
('6', 'A Máquina dos Sonhos espetacular', 120, 'Um inventor solitário cria uma máquina capaz de explorar os sonhos humanos, mas logo se vê preso em um labirinto de ilusões e realidades alternativas.', 2019, NULL),
('7', 'O espetacular Código da Sobrevivência', 90, 'Em um mundo pós-apocalíptico, um grupo de sobreviventes luta para decifrar um antigo código que pode conter a chave para a salvação da humanidade.', 2019, NULL),
('fae1bd8e-cc85-4261-b1b3-e71846eeaadb', 'A CAMA FOI QUEBRADA', 110, 'Uma serie de um professor que busca uma nova profissão, marceneiro', 2012, '3');

CREATE TABLE filme_pessoa (
  ID varchar(255) NOT NULL,
  IDFILME varchar(255) DEFAULT NULL,
  IDPESSOA varchar(255) DEFAULT NULL,
  FUNCAO varchar(255) DEFAULT NULL
) ;

INSERT INTO filme_pessoa (ID, IDFILME, IDPESSOA, FUNCAO) VALUES
('1', '1', '7', 'ATOR'),
('10', '4', '1', 'ATOR'),
('11', '4', '3', 'ATOR'),
('12', '4', '6', 'ATOR'),
('13', '4', '9', 'DIRETOR'),
('14', '4', '6', 'ATOR'),
('15', '4', '7', 'ATOR'),
('16', '4', '9', 'ATOR'),
('17', '4', '3', 'DIRETOR'),
('18', '5', '1', 'ATOR'),
('19', '5', '3', 'ATOR'),
('2', '1', '9', 'ATOR'),
('20', '5', '4', 'ATOR'),
('21', '5', '6', 'DIRETOR'),
('22', '6', '4', 'ATOR'),
('23', '6', '5', 'ATOR'),
('24', '6', '2', 'ATOR'),
('25', '6', '9', 'DIRETOR'),
('26', '4', '10', 'ATOR'),
('27', '3', '9', 'ATOR'),
('3', '1', '3', 'ATOR'),
('4', '1', '4', 'DIRETOR'),
('5', '2', '8', 'ATOR'),
('6', '2', '10', 'ATOR'),
('7', '2', '3', 'ATOR'),
('8', '2', '4', 'DIRETOR'),
('9', '3', '6', 'ATOR'),
('999', 'fae1bd8e-cc85-4261-b1b3-e71846eeaadb', NULL, NULL),
('a73c7658-9982-4766-8bb9-171fbbebc05d', 'fae1bd8e-cc85-4261-b1b3-e71846eeaadb', '10', 'DIRETOR'),
('b3c4bbf6-535a-4309-a592-07b6f59c80ad', 'fae1bd8e-cc85-4261-b1b3-e71846eeaadb', '10', 'ATOR');


CREATE TABLE genero (
  ID varchar(255) NOT NULL,
  NOME varchar(255) DEFAULT NULL,
  DESCRICAO varchar(255) DEFAULT NULL
) ;


INSERT INTO genero (ID, NOME, DESCRICAO) VALUES
('1', 'TERROR', 'PARA FICAR COM MEDO'),
('2', 'COMEDIA', 'PARA RIR MUITO'),
('3', 'AÇÃO', 'CHEIOS DE AÇÃO E EXPLOSÕES'),
('4', 'SUSPENSE', 'PARA FICAR SUSPENSO');

CREATE TABLE pessoa (
  ID varchar(255) NOT NULL,
  NOME varchar(255) DEFAULT NULL,
  NASCIMENTO varchar(255) DEFAULT NULL,
  PAIS varchar(255) DEFAULT NULL
) ;

INSERT INTO pessoa (ID, NOME, NASCIMENTO, PAIS) VALUES
('1', 'JOAO ROBERTO BARROSO', '01/01/2000', 'BRASIL'),
('10', 'LUDVIK VON KADOV', '09/06/1985', 'RUSSIA'),
('2', 'JONAS FARACO', '13/01/1960', 'EUA'),
('3', 'JAMES JIM', '21/12/1990', 'EUA'),
('4', 'ALBERTO JUAN CABRERO', '12/12/1950', 'MEXICO'),
('5', 'DOUGLAS DURINO', '09/06/1990', 'BRASIL'),
('5712b46d-5e0f-4935-8f4b-9ee764853e4f', 'Roberto Silva', '1990-01-01 00:00:00.000', 'Brasil'),
('6', 'CARLOS JOAO BEIRADA', '06/10/2010', 'BRASIL'),
('7', 'LEONARDO DI TAOXIM', '09/12/1980', 'CHINA'),
('8', 'ARNOLD SHOPEWHAUER', '11/09/1956', 'ALEMANHA'),
('9', 'JACKIE BIEBER', '01/01/1995', 'CANADA');


CREATE TABLE serie (
  ID varchar(255) NOT NULL,
  NOMESERIE varchar(255) DEFAULT NULL,
  TEMPORADA varchar(255) DEFAULT NULL,
  EPISODIO varchar(255) DEFAULT NULL,
  IDFILME varchar(255) DEFAULT NULL
) ;

INSERT INTO serie (ID, NOMESERIE, TEMPORADA, EPISODIO, IDFILME) VALUES
('ad56e2fc-c491-4a99-930f-4792123873ac', 'Breaking Bed', '01', '02', 'fae1bd8e-cc85-4261-b1b3-e71846eeaadb');

CREATE TABLE usuario (
  ID varchar(255) NOT NULL,
  EMAIL varchar(255) DEFAULT NULL,
  SENHA varchar(255) DEFAULT NULL,
  TELEFONE varchar(255) DEFAULT NULL,
  CIDADE varchar(255) DEFAULT NULL,
  ENDERECO varchar(255) DEFAULT NULL,
  CEP varchar(255) DEFAULT NULL,
  ASSINATURA datetime DEFAULT NULL,
  IDPESSOA varchar(255) DEFAULT NULL,
  FOTO varchar(255) DEFAULT NULL
) ;


INSERT INTO usuario (ID, EMAIL, SENHA, TELEFONE, CIDADE, ENDERECO, CEP, ASSINATURA, IDPESSOA, FOTO) VALUES
('1', 'JRBARROSO@TESTANDO.COM', '123456', '1488899', 'BAURU', 'RUA DAS FLORES 171', '17000000', '0000-00-00 00:00:00', '1', NULL),
('2', 'DOUGRINHA@GMAIL.COM', '882000477', '498498', 'SÃO PAULO', 'SANTA EFIGENIA 999', '00110000', '0000-00-00 00:00:00', '5', NULL),
('3', 'JONASATOR@ATORESBRASIL.COM.BR', '$2b$10$PnR0o1hypuIfngl2RZ4vGODUOTSQjqdaO7P.FYJirxu9SPXvvME7W', '9840980498', 'RIO DE JANEIRO', 'COPACABANA', '990815200', '0000-00-00 00:00:00', '5', NULL),
('c93d2720-9be6-4f64-842b-6c041cb179d6', 'teste@teste.com', '$2b$10$iFnFMFYl4v7L4bQf4NDsneODbrLQY3vbHUc6s8Xy7D0pODMibJ6DK', '(00)00000-0000', 'São Paulo', 'Rua Engenheiro Saint Martin', '17010150', '2030-02-18 21:50:54', '5712b46d-5e0f-4935-8f4b-9ee764853e4f', NULL);

ALTER TABLE aluguel
  ADD PRIMARY KEY (ID),
  ADD KEY IDFILME (IDFILME),
  ADD KEY IDUSUARIO (IDUSUARIO);


ALTER TABLE filme
  ADD PRIMARY KEY (ID),
  ADD KEY IDGENERO (IDGENERO);


ALTER TABLE filme_pessoa
  ADD PRIMARY KEY (ID),
  ADD KEY IDFILME (IDFILME),
  ADD KEY IDPESSOA (IDPESSOA);


ALTER TABLE genero
  ADD PRIMARY KEY (ID);


ALTER TABLE pessoa
  ADD PRIMARY KEY (ID);


ALTER TABLE serie
  ADD PRIMARY KEY (ID),
  ADD KEY IDFILME (IDFILME);


ALTER TABLE usuario
  ADD PRIMARY KEY (ID),
  ADD KEY IDPESSOA (IDPESSOA);


ALTER TABLE aluguel
  ADD CONSTRAINT aluguel_ibfk_1 FOREIGN KEY (IDFILME) REFERENCES filme (ID),
  ADD CONSTRAINT aluguel_ibfk_2 FOREIGN KEY (IDUSUARIO) REFERENCES usuario (ID);


ALTER TABLE filme
  ADD CONSTRAINT filme_ibfk_1 FOREIGN KEY (IDGENERO) REFERENCES genero (ID);


ALTER TABLE filme_pessoa
  ADD CONSTRAINT filme_pessoa_ibfk_1 FOREIGN KEY (IDFILME) REFERENCES filme (ID),
  ADD CONSTRAINT filme_pessoa_ibfk_2 FOREIGN KEY (IDPESSOA) REFERENCES pessoa (ID);


ALTER TABLE serie
  ADD CONSTRAINT serie_ibfk_1 FOREIGN KEY (IDFILME) REFERENCES filme (ID);

ALTER TABLE usuario
  ADD CONSTRAINT usuario_ibfk_1 FOREIGN KEY (IDPESSOA) REFERENCES pessoa (ID),
  ADD CONSTRAINT usuario_ibfk_2 FOREIGN KEY (FOTO) REFERENCES FILES (ID);
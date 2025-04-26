-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS locadora;
USE locadora;

-- Tabela de gêneros
CREATE TABLE generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Inserção dos gêneros
INSERT INTO generos (nome) VALUES 
('Horror'), 
('Comédia'), 
('Guerra'), 
('Suspense'), 
('Drama');

-- Tabela de filmes
CREATE TABLE filmes (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_genero INT,
    FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);

-- Inserção de 3 filmes por gênero
INSERT INTO filmes (titulo, id_genero) VALUES
-- Horror
('The Haunting', 1), ('Nightmare', 1), ('Ghost Story', 1),
-- Comédia
('Laugh Out Loud', 2), ('Crazy Neighbors', 2), ('Funny Business', 2),
-- Guerra
('Battlefield', 3), ('Heroes of War', 3), ('Last Stand', 3),
-- Suspense
('The Watcher', 4), ('Silent Screams', 4), ('The Secret', 4),
-- Drama
('Tears of Life', 5), ('Broken Roads', 5), ('Deep Hearts', 5);

-- Tabela de usuários
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

-- Inserção de 4 usuários
INSERT INTO usuarios (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Oliveira', 'maria@email.com'),
('Carlos Souza', 'carlos@email.com'),
('Ana Lima', 'ana@email.com');

-- Tabela de atores
CREATE TABLE atores (
    id_ator INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Inserção de 10 atores únicos
INSERT INTO atores (nome) VALUES
('Ator 1'), ('Ator 2'), ('Ator 3'), ('Ator 4'), ('Ator 5'),
('Ator 6'), ('Ator 7'), ('Ator 8'), ('Ator 9'), ('Ator 10');

-- Tabela intermediária filme_ator
CREATE TABLE filme_ator (
    id_filme INT,
    id_ator INT,
    PRIMARY KEY (id_filme, id_ator),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme),
    FOREIGN KEY (id_ator) REFERENCES atores(id_ator)
);

-- Inserção de 5 atores para cada filme (usando atores repetidos)
INSERT INTO filme_ator (id_filme, id_ator) VALUES
(1,1), (1,2), (1,3), (1,4), (1,5),
(2,2), (2,3), (2,6), (2,7), (2,8),
(3,1), (3,4), (3,5), (3,9), (3,10),
(4,1), (4,2), (4,3), (4,4), (4,6),
(5,2), (5,5), (5,7), (5,8), (5,9),
(6,3), (6,6), (6,7), (6,9), (6,10),
(7,1), (7,2), (7,3), (7,4), (7,5),
(8,6), (8,7), (8,8), (8,9), (8,10),
(9,1), (9,3), (9,5), (9,7), (9,9),
(10,2), (10,4), (10,6), (10,8), (10,10),
(11,1), (11,2), (11,3), (11,4), (11,5),
(12,6), (12,7), (12,8), (12,9), (12,10),
(13,1), (13,3), (13,5), (13,7), (13,9),
(14,2), (14,4), (14,6), (14,8), (14,10),
(15,1), (15,2), (15,3), (15,4), (15,5);

-- Tabela de transações
CREATE TABLE transacoes (
    id_transacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_filme INT,
    tipo INT NOT NULL, -- 0: aluguel, 1: retorno
    data_transacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme)
);

-- Duas transações (aluguel e retorno) para cada filme
INSERT INTO transacoes (id_usuario, id_filme, tipo) VALUES
(1,1,0), (1,1,1),
(2,2,0), (2,2,1),
(3,3,0), (3,3,1),
(4,4,0), (4,4,1),
(1,5,0), (1,5,1),
(2,6,0), (2,6,1),
(3,7,0), (3,7,1),
(4,8,0), (4,8,1),
(1,9,0), (1,9,1),
(2,10,0), (2,10,1),
(3,11,0), (3,11,1),
(4,12,0), (4,12,1),
(1,13,0), (1,13,1),
(2,14,0), (2,14,1),
(3,15,0), (3,15,1);

-- Exclusão do gênero DRAMA e tudo relacionado
DELETE FROM transacoes WHERE id_filme IN (
    SELECT id_filme FROM filmes WHERE id_genero = 5
);

DELETE FROM filme_ator WHERE id_filme IN (
    SELECT id_filme FROM filmes WHERE id_genero = 5
);

DELETE FROM filmes WHERE id_genero = 5;

DELETE FROM generos WHERE nome = 'Drama';

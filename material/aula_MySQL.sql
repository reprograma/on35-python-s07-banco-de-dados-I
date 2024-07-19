CREATE DATABASE estoque;
USE estoque; 

CREATE TABLE filmes (
id INTEGER PRIMARY KEY,
titulo TEXT,
genero TEXT,
diretor TEXT,
ano_lancamento INTEGER,
preco REAL
);
-- Insira alguns filmes para teste
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (1, 'O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (2, 'Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (3, 'O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

SELECT*FROM filmes;

CREATE TABLE estoque_filmes (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
filme_id INTEGER,
quantidade INTEGER,
status VARCHAR(20),
FOREIGN KEY (filme_id) REFERENCES filmes(id)
);

INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES
(1, 10, 'Disponível'),
(2, 5, 'Disponível'),
(3, 15, 'Disponível');

SELECT*FROM estoque_filmes;
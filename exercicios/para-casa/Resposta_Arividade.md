# Exercício de Casa 🏠 

CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) 
VALUES 
('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90),
('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90),
('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);


CREATE TABLE estoque_filmes (
    id INTEGER PRIMARY KEY,
  	id_filmes INTEGER,
  	quantidade INTEGER,
  	status TEXT,
  	FOREIGN KEY (id_filmes) REFERENCES filmes (id)
);

INSERT INTO estoque_filmes (id_filmes, quantidade, status) 
VALUES
(50, 55, 'Disponível'),
(5, 10, 'Disponível'),
(12, 20, 'Disponível'),
(2, 5, 'Disponível');

SELECT id_filmes, quantidade, status FROM estoque_filmes
where id_filmes = 2

SELECT id_filmes, status FROM estoque_filmes
where status = 'Disponível'

UPDATE estoque_filmes SET status = 'Alugado' WHERE id_filmes = 5;
UPDATE estoque_filmes SET quantidade = 2 WHERE id_filmes = 1;

UPDATE estoque_filmes SET status = 'Disponivel' WHERE id_filmes = 2;
UPDATE estoque_filmes SET quantidade = 85 WHERE id_filmes = 2;

SELECT id_filmes, quantidade, status FROM estoque_filmes
where id_filmes = 2

UPDATE estoque_filmes SET status = 'Manutenção' WHERE id_filmes = 50;

SELECT id_filmes, status FROM estoque_filmes
where status = 'Manutenção' 

UPDATE estoque_filmes SET status = 'Em manutenção' WHERE id_filmes = 12;


SELECT * from estoque_filmes

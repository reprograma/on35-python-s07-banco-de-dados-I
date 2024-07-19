--15/07/2024
-- Criar a tabela 'filmes'
CREATE TABLE filmes (
id INTEGER PRIMARY KEY,
titulo TEXT,
genero TEXT,
diretor TEXT,
ano_lancamento INTEGER,
preco REAL
);
-- Inserir alguns filmes de exemplo
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES
	('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90),
	('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994,29.90),
	('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90),
	('O Cavaleiro das Trevas', 'Ação', 'Christopher Nolan', 2008, 39.90),
	('A Origem', 'Ficção Científica', 'Christopher Nolan', 2010, 37.90);
    
-- Criar a tabela 'atores'
CREATE TABLE atores (
id INTEGER PRIMARY KEY,
nome TEXT
);
Código SQL para criar as tabelas e inserir dados de exemplo: 2

-- Inserir alguns atores de exemplo
INSERT INTO atores (nome) VALUES
('Marlon Brando'),
('Al Pacino'),
('John Travolta'),
('Samuel L. Jackson'),
('Elijah Wood'),
('Viggo Mortensen'),
('Christian Bale'),
('Leonardo DiCaprio');

-- Criar a tabela 'filmes_atores' (relação muitos-para-muitos)

CREATE TABLE filmes_atores (
id INTEGER PRIMARY KEY,
filme_id INTEGER,
ator_id INTEGER,
FOREIGN KEY (filme_id) REFERENCES filmes(id),
FOREIGN KEY (ator_id) REFERENCES atores(id)
);

-- Inserir alguns relacionamentos entre filmes e atores
INSERT INTO filmes_atores (filme_id, ator_id) VALUES
(1, 1), -- Marlon Brando em "O Poderoso Chefão"
(1, 2), -- Al Pacino em "O Poderoso Chefão"
(2, 3), -- John Travolta em "Pulp Fiction"
(2, 4), -- Samuel L. Jackson em "Pulp Fiction"
(3, 5), -- Elijah Wood em "O Senhor dos Anéis"
(3, 6), -- Viggo Mortensen em "O Senhor dos Anéis"
(4, 7), -- Christian Bale em "O Cavaleiro das Trevas"
(5, 8); -- Leonardo DiCaprio em "A Origem"

SELECT * FROM filmes;
SELECT * FROM atores;
SELECT * FROM filmes_atores;

drop TABLE demo;

SELECT f.titulo, a.nome
FROM filmes f
inner JOIN filmes_atores fa ON f.id = fa.filme_id
inner JOIN atores a on fa.ator_id = a.id
WHERE a.nome like '%Pacino%';

SELECT f.titulo. a.nome
FROM filmes f
LEFT JOIN filmes_atores fa ON f.id = fa.filme_id
LEFT JOIN atores a ON fa.ator_id = a.id;
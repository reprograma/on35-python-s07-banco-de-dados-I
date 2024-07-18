CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

-- Insira alguns filmes para teste
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

CREATE TABLE estoque_filmes (
    id INTEGER PRIMARY KEY,
  	filmes_id INTEGER,
    quantidade INTEGER,
  	status TEXT, 
    FOREIGN KEY (filmes_id) REFERENCES filmes(id)
);

INSERT INTO estoque_filmes (filmes_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filmes_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filmes_id, quantidade, status) VALUES (3, 15, 'Disponível');

-- Obter a quantidade disponível em estoque para um determinado filme: (Ex.: Para o filme com ID 2)
SELECT * FROM estoque_filmes WHERE id = 2

-- Verificar se um filme está disponível para aluguel: (Ex.: Para o filme com ID 3)
SELECT f.titulo, e.status
FROM filmes f
INNER JOIN estoque_filmes e ON f.id = e.filmes_id
where f.id = 3 and e.status ='Disponível'



-- Atualizar o status de um filme para "Alugado": (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)
SELECT * FROM estoque_filmes

UPDATE estoque_filmes
SET quantidade = quantidade - 1, status = 'Alugado'
WHERE filmes_id = 1;

SELECT * FROM estoque_filmes

-- Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)

UPDATE estoque_filmes
SET quantidade = quantidade + 1, status = 'Disponível'
WHERE filmes_id = 2;

SELECT * FROM estoque_filmes

-- Obter a lista de todos os filmes disponíveis para aluguel:
SELECT * FROM estoque_filmes
WHERE status = 'Disponível'

-- Obter a lista de filmes que estão em "Manutenção":

SELECT * FROM estoque_filmes
WHERE status = 'Manutenção'

-- Atualizar o status de um filme para "Em Manutenção": (Ex.: Para o filme com ID 3)

UPDATE estoque_filmes
SET quantidade = quantidade - 1, status = 'Manutenção'
WHERE filmes_id = 3;

SELECT * FROM estoque_filmes
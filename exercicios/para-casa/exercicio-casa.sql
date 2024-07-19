-- Criar a tabela filmes 
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
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90)
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Cavaleiro das Trevas', 'Ação', 'Christopher Nolan', 2008, 39.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('A Origem', 'Ficção Científica', 'Christopher Nolan', 2010, 37.90);

-- Criar a tabela estoque_filmes 
CREATE TABLE estoque_filmes(
	id INTEGER PRIMARY KEY,
  	filme_id INTEGER,
  	quantidade INTEGER,
  	status VARCHAR(15),
  	FOREIGN KEY(filme_id) REFERENCES filmes(id)
)

-- Insira alguns dados de estoque_filmes para teste
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (4, 20, 'Manutenção');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (5, 30, 'Manutenção');

-- Criar a tabela 'atores' 
CREATE TABLE atores (
  id INTEGER PRIMARY KEY,
  nome TEXT
);

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

-- Criar a tabela 'filmes_atores' (relação n-para-n)
CREATE TABLE filmes_atores( 
  id INTEGER PRIMARY KEY,
  filme_id INTEGER, 
  ator_id INTEGER,
  FOREIGN KEY (filme_id) REFERENCES filmes(id), 
  FOREIGN KEY (ator_id) REFERENCES atores(id)
);

-- Inserir alguns relacionamentos entre filmes e atores 
INSERT INTO filmes_atores (filme_id, ator_id) VALUES
(1,	1),	--	Marlon Brando em "O Poderoso Chefão"
(1,	2),	--	Al Pacino em "O Poderoso Chefão"
(2,	3),	--	John Travolta em "Pulp Fiction"
(2,	4),	--	Samuel L. Jackson em "Pulp Fiction"
(3,	5),	--	Elijah Wood em "O Senhor dos Anéis"
(3,	6),	--	Viggo Mortensen em "O Senhor dos Anéis"
(4,	7),	--	Christian Bale em "O Cavaleiro das Trevas"
(5,	8);	--	Leonardo DiCaprio em "A Origem"

-- 1 - Obter a quantidade disponível em estoque para um determinado filme: (Ex.: Para o filme com ID 2)
SELECT F.titulo,F.genero,E.quantidade AS 'qtd',E.status
FROM filmes F
JOIN estoque_filmes E
ON F.id = E.filme_id
WHERE filme_id = 2;

-- 2 - Verificar se um filme está disponível para aluguel: (Ex.: Para o filme com ID 3)
SELECT F.titulo,F.genero,F.diretor, F.ano_lancamento, F.preco, E.quantidade, E.status
FROM filmes F
JOIN estoque_filmes E
ON F.id = E.filme_id
WHERE filme_id = 3;

-- 3 - Atualizar o status de um filme para "Alugado": (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)
UPDATE estoque_filmes 
SET status = 'Alugado',
    quantidade = 2
WHERE filme_id = 1;

-- 4 - Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)
UPDATE estoque_filmes 
SET status = 'Disponível',
	quantidade = 50
WHERE filme_id = 5;

-- 5 - Obter a lista de todos os filmes disponíveis para aluguel:
SELECT F.titulo,F.genero,F.diretor,F.ano_lancamento, F.preco, E.quantidade, E.status
FROM filmes F
INNER JOIN estoque_filmes E
ON F.id = E.filme_id
WHERE E.status = 'Disponível';

-- 6 - Obter a lista de filmes que estão em "Manutenção":
SELECT F.titulo,F.genero,F.diretor, F.ano_lancamento, F.preco, E.quantidade, E.status
FROM filmes F
INNER JOIN estoque_filmes E
ON F.id = E.filme_id
WHERE E.status = 'Manutenção'
ORDER BY quantidade;

-- 7 - Atualizar o status de um filme para "Em Manutenção": (Ex.: Para o filme com ID 3)
UPDATE estoque_filmes 
SET status = 'Manutenção'
WHERE filme_id = 3;

--Extra
SELECT F.titulo,F.genero,F.diretor, A.nome AS 'ator principal',F.ano_lancamento, F.preco, E.quantidade, E.status
FROM filmes F
INNER join estoque_filmes E
ON F.id = E.filme_id
INNER JOIN filmes_atores FA
ON F.id = FA.filme_id
INNER JOIN atores A
ON FA.ator_id = A.id
WHERE E.status = 'Manutenção' and nome = 'Elijah Wood'
ORDER BY quantidade;
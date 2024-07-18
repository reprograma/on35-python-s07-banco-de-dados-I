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
    filme_id INTEGER,
    quantidade INTEGER,
  	status TEXT,
  FOREIGN KEY (filme_id) REFERENCES filmes(id)
);


INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Alugado');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Em Manutenção');


--Obter a quantidade disponível em estoque para um determinado filme

--opção 1
SELECT quantidade FROM estoque_filmes
where filme_id =2 and status = 'Disponível'

--opção 2
SELECT quantidade FROM estoque_filmes
where filme_id =2 

-- Verificar se um filme está disponível para aluguel
SELECT filme_id, status FROM estoque_filmes
where status = 'Disponível'

-- Atualizar o status de um filme para "Alugado": (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)
	UPDATE estoque_filmes SET status = 'Alugado' WHERE id = 1;
    UPDATE estoque_filmes SET quantidade = 9 WHERE id = 1;
    
	
-- Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)
	UPDATE estoque_filmes SET status = 'Disponível' WHERE id = 2;
    UPDATE estoque_filmes SET quantidade = 6 WHERE id = 2;
    
-- Obter a lista de todos os filmes disponíveis para aluguel:
SELECT f.titulo, e.filme_id, e.status
FROM filmes f
INNER JOIN estoque_filmes e ON f.id = e.filme_id
WHERE e.status = 'Disponível';

-- Obter a lista de filmes que estão em "Manutenção":
SELECT filme_id, status FROM estoque_filmes
where status = 'Em Manutenção'

-- Atualizar o status de um filme para "Em Manutenção": (Ex.: Para o filme com ID 3)
UPDATE estoque_filmes SET status = 'Em Manutenção' WHERE id = 2;


-- Consultas 

SELECT* from estoque_filmes
SELECT* from filmes

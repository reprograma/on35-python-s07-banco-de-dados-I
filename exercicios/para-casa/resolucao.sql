CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

SELECT * FROM filmes

INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Frances Ha', 'Comédia', 'Noah Baumbach', 2012, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Em Trânsito', 'Drama', 'Christian Petzold', 2018, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Cléo de 5 às 7', 'Drama', 'Agnès Varda', 1962, 35.90);

CREATE TABLE estoque_filmes (
  id INTEGER PRIMARY KEY,
  filme_id INTEGER,
  quantidade INTEGER,
  status TEXT,
  FOREIGN KEY (filme_id) REFERENCES filmes (id)
  );
  
 SELECT * FROM estoque_filmes
  
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');


SELECT
 filmes.titulo,
 filmes.genero,
 filmes.diretor,
 filmes.ano_lancamento,
 filmes.preco,
 estoque_filmes.quantidade,
 estoque_filmes.status
 FROM
  estoque_filmes
 JOIN
  filmes ON estoque_filmes.filme_id=filmes.id;
  

-- 1) Obter a quantidade disponível em estoque para o filme com ID 2:

SELECT filme_id, quantidade FROM estoque_filmes WHERE id=2;

-- 2) Verificar se um filme com ID 3 está disponível para aluguel:

SELECT filme_id, status FROM estoque_filmes WHERE id = 3;

-- 3) Atualizar o status de um filme para "Alugado". Ex: Para o filme com ID 1, diminuindo a quantidade em estoque

UPDATE estoque_filmes SET quantidade = quantidade - 1, status = 'Alugado' WHERE filme_id = 1; 

-- 4) Atualizar o status de um filme para "Disponível": Ex: Para o filme com ID 2, aumentando a quantidade em estoque

UPDATE estoque_filmes SET quantidade = quantidade + 1, status = 'Disponível' WHERE filme_id = 2; 

-- 5) Obter a lista de todos os filmes disponíveis para aluguel:

SELECT filmes.titulo, estoque_filmes.quantidade, estoque_filmes.status 
FROM filmes
JOIN estoque_filmes ON filmes.id = estoque_filmes.filme_id
WHERE estoque_filmes.status = 'Disponível';

-- 6) Obter a lista de filmes que estão em "Manutenção":

SELECT filmes.titulo, estoque_filmes.quantidade, estoque_filmes.status 
FROM filmes
JOIN estoque_filmes ON filmes.id = estoque_filmes.filme_id
WHERE estoque_filmes.status = 'Em Manutenção';

-- 7) Atualizar o status de um filme com ID 3 para "Em Manutenção":

UPDATE estoque_filmes SET status = 'Em Manutenção' WHERE filme_id = 3;
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

select * from filmes;

create table estoque_filmes (
  id integer primary key,
  filmes_id integer, 
  quantidade integer,
  status text
  );

INSERT INTO estoque_filmes (filmes_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filmes_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filmes_id, quantidade, status) VALUES (3, 15, 'Disponível');

select * from estoque_filmes;

-- 1. Consulta quantidade id=2
SELECT * 
FROM estoque_filmes
WHERE id = 2;

-- 2. Consulta quantidade id=3
SELECT * 
FROM estoque_filmes
WHERE id=3 
GROUP by status;

-- 3. Atualizar alugado id=1 menos 1

UPDATE estoque_filmes
SET quantidade = quantidade - 10
WHERE id = 1; 
UPDATE estoque_filmes
set status = 'Alugado'
WHERE id = 1; 

select * from estoque_filmes;

-- 4 
UPDATE estoque_filmes
SET quantidade = quantidade - 5
WHERE id = 2; 
UPDATE estoque_filmes
set status = 'Alugado'
WHERE id = 2; 
UPDATE estoque_filmes
SET quantidade = quantidade + 1
WHERE id = 2;
UPDATE estoque_filmes
set status = 'Disponível'
WHERE id = 2; 

-- Consulta após o incremento
SELECT * FROM estoque_filmes;

-- 5 Realizar JOIN entre as tabelas 
SELECT 
    filmes.titulo, 
    filmes.preco, 
    estoque_filmes.quantidade, 
    estoque_filmes.status
FROM 
    estoque_filmes
JOIN 
    filmes ON estoque_filmes.filmes_id = filmes.id;
    
 -- 6 
 SELECT * 
FROM estoque_filmes
WHERE status = 'Manutenção' 
GROUP by status;

-- 7 

UPDATE estoque_filmes
SET quantidade = quantidade - 15
WHERE id = 3; 
UPDATE estoque_filmes
SET Status = 'Em Manutenção'
WHERE id = 3; 
CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);
select * from filmes
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

CREATE TABLE estoque_filmes (
  id  INTEGER PRIMARY KEY,
  filme_id INTEGER,  
  quantidade INTEGER,
  status TEXT,
  FOREIGN KEY (filme_id) REFERENCES filmes(id)
  );
select * from estoque_filmes
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');

delete from estoque_filmes where id in (4,5,6);

--Obter a quantidade disponível em estoque para um determinado filme
SELECT quantidade 
from estoque_filmes 
where filme_id = 2

--Verificar se um filme está disponível para aluguel
select status 
from estoque_filmes 
where filme_id = 3 

--Atualizar o status de um filme para "Alugado": (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)
update estoque_filmes 
set status = 'Alugado', quantidade = quantidade -1 
where id = 1

--Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)
update estoque_filmes 
set status = 'Disponível', quantidade = quantidade +1 
where id = 1

--Obter a lista de todos os filmes disponíveis para aluguel:
select f.titulo, e.filme_id, e.status
from filmes f 
inner join estoque_filmes e on f.id = e.filme_id
where e.status = 'Disponível'

--Obter a lista de filmes que estão em "Manutenção"
select f.titulo, e.filme_id, e.status
from filmes f 
inner join estoque_filmes e on f.id = e.filme_id
where e.status = 'Em manutenção'

--Atualizar o status de um filme para "Em Manutenção": (Ex.: Para o filme com ID 3)
update estoque_filmes 
set status = 'Em manutenção'
where filme_id = 3

  CREATE TABLE estoque_filmes (
      id INTEGER PRIMARY KEY,
      filme_id INTEGER,
      quantidade INTEGER,
      status TEXT
  );

  INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
  INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5,  'Disponível');
  INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');
  INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (4, 25, 'Disponível');
  INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (5, 30, 'Disponível');

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
  INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Harry Potter e a Pedra Filosofal', 'Fantasia', 'J. K. Rowling', 1997, 24.90);
  UPDATE filmes SET ano_lancamento = 2001 WHERE id = 4;
  INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Harry Potter e a Câmara Secreta', 'Fantasia', 'J. K. Rowling', 1997, 24.90);
  UPDATE filmes SET ano_lancamento = 2002 WHERE id = 5;
  SELECT * FROM estoque_filmes
  SELECT * FROM filmes
   -- 1 Obter a quantidade disponível em estoque para um determinado filme: (Ex.: Para o filme com ID 2)
   SELECT quantidade FROM estoque_filmes WHERE status = 'Disponível' AND filme_id = 2;
   DELETE from estoque_filmes WHERE id IN (4,5,6);

   -- 2 Verificar se um filme está disponível para aluguel: (Ex.: Para o filme com ID 3)
   SELECT
      f.titulo, e.status, e.quantidade
  from filmes f
  JOIN estoque_filmes e ON f.id = e.filme_id
  WHERE f.id = 3;

  -- 3 Atualizar o status de um filme para "Alugado": (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)
  UPDATE estoque_filmes SET status = 'Alugado', quantidade = quantidade - 1 WHERE filme_id = 1;
  DELETE from estoque_filmes

  -- 4 Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)
  UPDATE estoque_filmes SET status = 'Disponivel', quantidade = quantidade + 1 WHERE filme_id = 2;
  UPDATE estoque_filmes SET status = 'Disponível' WHERE filme_id = 2;

  -- 5 Obter a lista de todos os filmes disponíveis para aluguel:
  SELECT f.titulo, e.status, e.quantidade
  FROM filmes f
  JOIN estoque_filmes e on f.id  = e.filme_id
  where e.status = 'Disponível';
  SELECT * FROM estoque_filmes
  SELECT * FROM filmes
  -- 7 Atualizar o status de um filme para "Em Manutenção": (Ex.: Para o filme com ID 3)
  UPDATE estoque_filmes SET status = 'Manutenção' WHERE filme_id = 3;

  -- 6 Obter a lista de filmes que estão em "Manutenção":
  SELECT f.titulo, e.status, e.quantidade
  FROM filmes f
  join estoque_filmes e on f.id = e.filme_id
  WHERE e.status = 'Manutenção';


--SQLite
--Exercício 8: Gerenciamento de Vendas de Livros

--Criar a tabela vendas

CREATE TABLE vendas (
    id INTEGER PRIMARY KEY,
  	livro_id INTEGER,
  	data_venda DATE,
  	quantidade INTEGER,
    FOREIGN KEY(livro_id) REFERENCES livros(id)
)

SELECT * FROM vendas;

--Inserir alguns registros de vendas para teste

INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (1, '2024-05-10', 3);  -- Venda de 3 exemplares de 'Dom Quixote'
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (2, '2024-05-09', 5);  -- Venda de 5 exemplares de 'Orgulho e Preconceito'
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (3, '2024-05-08', 2);  -- Venda de 2 exemplares de '1984'

SELECT * FROM vendas;

--Realizar um JOIN entre as tabelas livros e vendas para obter as informações sobre livros vendidos, incluindo título, autor, data da venda e quantidade vendida

SELECT L.titulo,L.autor, V.data_venda, V.quantidade
FROM livros L
JOIN vendas V
ON L.id = V.livro_id;
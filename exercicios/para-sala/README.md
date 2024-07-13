# Exercício de Sala 🏫  

### Exercício 1: Criar uma Tabela
Crie uma tabela chamada `alunos` com as seguintes colunas:
- `id` (inteiro, chave primária)
- `nome` (texto)
- `idade` (inteiro)

```sql

CREATE TABLE alunos (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    idade INTEGER
);

```

### Exercício 2: Inserir Dados
Insira três registros na tabela `alunos` com os seguintes dados:
1. Nome: "João", Idade: 20
2. Nome: "Maria", Idade: 22
3. Nome: "Pedro", Idade: 19

```sql
INSERT INTO alunos (nome, idade) VALUES ('João', 20);
INSERT INTO alunos (nome, idade) VALUES ('Maria', 22);
INSERT INTO alunos (nome, idade) VALUES ('Pedro', 19);

```

### Exercício 3: Selecionar Dados
Selecione todos os registros da tabela `alunos` e exiba o resultado.

```sql
SELECT * FROM alunos;
```

### Exercício 4: Atualizar Dados
Atualize a idade do aluno com `id` igual a 2 para 23 anos.

```SQL
UPDATE alunos SET idade = 23 WHERE id = 2;
```

### Exercício 5: Excluir Dados
Exclua o aluno com `id` igual a 3 da tabela `alunos`.

```SQL
DELETE FROM alunos WHERE id = 3;
```

---

### Exercício 6: Problema da Loja de Livros

Suponha que você esteja gerenciando uma loja de livros online e precise criar um banco de dados para armazenar informações sobre os livros disponíveis. Você foi encarregado de projetar o esquema do banco de dados e realizar algumas consultas básicas.

**Problema:**

Você precisa criar uma tabela chamada `livros` para armazenar os seguintes dados sobre os livros:

- `id`: Identificador único para cada livro (inteiro, chave primária).
- `titulo`: Título do livro (texto).
- `autor`: Nome do autor do livro (texto).
- `ano_publicacao`: Ano de publicação do livro (inteiro).
- `preco`: Preço do livro (real).

Além disso, você deve inserir três registros de livros na tabela para fins de teste. Aqui estão os dados para inserção:

1. Título: "Dom Quixote", Autor: "Miguel de Cervantes", Ano de Publicação: 1605, Preço: R$ 29.90
2. Título: "Orgulho e Preconceito", Autor: "Jane Austen", Ano de Publicação: 1813, Preço: R$ 25.50
3. Título: "1984", Autor: "George Orwell", Ano de Publicação: 1949, Preço: R$ 35.75

Depois de criar a tabela e inserir os dados, escreva consultas SQL para as seguintes perguntas:

1. Selecione todos os livros da tabela.
2. Selecione o título e o autor de todos os livros publicados após o ano de 2010.
3. Selecione o título, autor e preço dos livros com preço superior a R$ 30,00.

Espero que este exercício continue a te ajudar a praticar SQL! Se precisar de mais alguma coisa, estou à disposição.

Antes de resolver o exercício pulverizar o banco, aqui está o código

```SQL
-- Criar a tabela 'livros'
CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    ano_publicacao INTEGER,
    preco REAL
);

-- Inserir os registros de livros
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Dom Quixote', 'Miguel de Cervantes', 1605, 29.90);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Orgulho e Preconceito', 'Jane Austen', 1813, 25.50);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('1984', 'George Orwell', 1949, 35.75);
```

---

### Exercício 8: Gerenciamento de Vendas de Livros

Suponha que você esteja expandindo sua loja de livros online e agora precisa acompanhar as vendas dos livros. Você deve criar uma tabela para armazenar informações sobre as vendas dos livros e depois realizar uma consulta para obter informações sobre os livros vendidos.

**Problema:**

Você precisa criar uma nova tabela chamada `vendas` para armazenar as seguintes informações sobre as vendas dos livros:

- `id`: Identificador único para cada venda (inteiro, chave primária).
- `livro_id`: Identificador do livro vendido (chave estrangeira referenciando a tabela `livros`).
- `data_venda`: Data da venda do livro (data).
- `quantidade`: Quantidade de exemplares vendidos (inteiro).

Além disso, você deve inserir alguns registros de vendas para teste e, em seguida, realizar um JOIN entre as tabelas `livros` e `vendas` para obter informações sobre os livros vendidos, incluindo título, autor, data da venda e quantidade vendida.

Escreva o código SQL necessário para:

1. Criar a tabela `vendas`.
2. Inserir alguns registros de vendas para teste.
3. Realizar um JOIN entre as tabelas `livros` e `vendas` para obter as informações solicitadas.

```sql
-- Criar a tabela 'vendas'
CREATE TABLE vendas (
    id INTEGER PRIMARY KEY,
    livro_id INTEGER,
    data_venda DATE,
    quantidade INTEGER,
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Inserir alguns registros de vendas para teste
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (1, '2024-05-10', 3);  -- Venda de 3 exemplares de 'Dom Quixote'
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (2, '2024-05-09', 5);  -- Venda de 5 exemplares de 'Orgulho e Preconceito'
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (3, '2024-05-08', 2);  -- Venda de 2 exemplares de '1984'

-- Realizar JOIN entre as tabelas 'livros' e 'vendas'
SELECT 
    livros.titulo, 
    livros.autor, 
    vendas.data_venda, 
    vendas.quantidade
FROM 
    vendas
JOIN 
    livros ON vendas.livro_id = livros.id;
```

---

### Exercício 9: Sistema de Votação Online para Melhores Livros do Ano

Imagine que você está desenvolvendo um sistema de votação online para uma competição de melhores livros do ano. Você precisa criar uma tabela para armazenar os votos dos usuários e depois escrever consultas SQL para realizar operações básicas de contagem de votos e análise dos resultados.

**Problema:**

Você precisa criar uma tabela chamada `votos` para armazenar as seguintes informações sobre os votos dos usuários:

- `id`: Identificador único para cada voto (inteiro, chave primária).
- `id_usuario`: Identificador único do usuário que votou (inteiro).
- `id_livro`: Identificador único do livro votado (inteiro).
- `data_voto`: Data e hora em que o voto foi registrado (datetime).

Além disso, você deve inserir alguns registros na tabela `votos` para teste.

Escreva consultas SQL para realizar as seguintes operações:

1. Contar o número total de votos recebidos por cada livro.
2. Identificar os livros mais votados.
3. Verificar se um determinado usuário já votou em um determinado livro.
4. Obter a lista de livros votados por um usuário específico.

```sql
-- Criar a tabela 'votos'
CREATE TABLE votos (
    id INTEGER PRIMARY KEY,
    id_usuario INTEGER,
    id_livro INTEGER,
    data_voto DATETIME
);

-- Inserir alguns registros de exemplo na tabela 'votos'
INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (1, 1, '2024-05-10 08:30:00');  -- Voto do usuário 1 para o livro 1
INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (2, 2, '2024-05-10 09:45:00');  -- Voto do usuário 2 para o livro 2
INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (1, 3, '2024-05-10 10:15:00');  -- Voto do usuário 1 para o livro 3
```
---

## Exercício 10

Este exercício e uma previa do exercício de casa:

```sql
-- Criar a tabela 'votos'
CREATE TABLE votos (
    id INTEGER PRIMARY KEY,
    id_usuario INTEGER,
    estoque INTEGER,
);

-- Inserir alguns registros de exemplo na tabela 'votos'
INSERT INTO votos (id_usuario, id_livro, estoque) VALUES (1, 1, 40);
INSERT INTO votos (id_usuario, id_livro, estoque) VALUES (2, 2, 20);  
INSERT INTO votos (id_usuario, id_livro, estoque) VALUES (1, 3, 1);  
```

agora consulta 

```sql
-- Consulta por ordem
SELECT *
FROM votos
ORDER BY estoque;

-- Incremento usando SET na coluna estoque
UPDATE votos
SET estoque = estoque + 1
WHERE id = 1; -- Supondo que você deseja incrementar o estoque do voto com ID 1

-- Consulta após o incremento
SELECT *
FROM votos;

```

---

Terminou o exercício? Dá uma olhada nessa checklist e confere se tá tudo certinho, combinado?!

- [ ] Fiz o fork do repositório.
- [ ] Clonei o fork na minha máquina (`git clone url-do-meu-fork`).
- [ ] Resolvi o exercício.
- [ ] Adicionei as mudanças. (`git add .` para adicionar todos os arquivos, ou `git add nome_do_arquivo` para adicionar um arquivo específico)
- [ ] Commitei a cada mudança significativa ou na finalização do exercício (`git commit -m "Mensagem do commit"`)
- [ ] Pushei os commits na minha branch (`git push origin nome-da-branch`)

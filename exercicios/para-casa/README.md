# Exercício de Casa 🏠 

## 🎥Gerenciamento de Estoque de Filmes

**Imagine:** Você está trabalhando em uma plataforma de streaming online, e precisa criar um banco de dados para gerenciar o estoque de filmes disponíveis para aluguel. 

**Problema:**

Você precisa criar uma tabela chamada `estoque_filmes` para armazenar as seguintes informações sobre os filmes em estoque:

* **`id`**: Identificador único para cada registro de estoque (inteiro, chave primária).
* **`filme_id`**: Identificador do filme (chave estrangeira referenciando a tabela `filmes`).
* **`quantidade`**: Quantidade de cópias do filme disponível no estoque (inteiro).
* **`status`**:  Status atual do filme (texto, podendo ser "Disponível", "Alugado", "Em Manutenção").

**Dados para Teste:**

Crie a tabela `filmes` para armazenar informações básicas sobre os filmes:

```sql
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
```

Depois, insira alguns registros na tabela `estoque_filmes`:

```sql
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');
```

**Consultas SQL:**

Escreva consultas SQL para realizar as seguintes operações:

1. **Obter a quantidade disponível em estoque para um determinado filme:**  (Ex.: Para o filme com ID 2)

2. **Verificar se um filme está disponível para aluguel:** (Ex.: Para o filme com ID 3)

3. **Atualizar o status de um filme para "Alugado"**: (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)

4. **Atualizar o status de um filme para "Disponível"**: (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)

5. **Obter a lista de todos os filmes disponíveis para aluguel:** 

6. **Obter a lista de filmes que estão em "Manutenção":**

7. **Atualizar o status de um filme para "Em Manutenção"**: (Ex.: Para o filme com ID 3)

**Dicas:**

* Utilize o `JOIN` para combinar informações de diferentes tabelas (`filmes` e `estoque_filmes`).
* Utilize `WHERE` para filtrar os registros que você deseja consultar.
* Utilize `UPDATE` para modificar os dados da tabela `estoque_filmes`.

Lembre-se de utilizar comentários (`--`) para explicar cada comando SQL e facilitar a leitura do seu código.

--

Terminou o exercício? Dá uma olhada nessa checklist e confere se tá tudo certinho, combinado?!

- [ ] Fiz o fork do repositório.
- [ ] Clonei o fork na minha máquina (`git clone url-do-meu-fork`).
- [ ] Resolvi o exercício.
- [ ] Adicionei as mudanças. (`git add .` para adicionar todos os arquivos, ou `git add nome_do_arquivo` para adicionar um arquivo específico)
- [ ] Commitei a cada mudança significativa ou na finalização do exercício (`git commit -m "Mensagem do commit"`)
- [ ] Pushei os commits na minha branch (`git push origin nome-da-branch`)
- [ ] Criei um Pull Request seguindo as orientaçoes que estao nesse [documento](https://github.com/mflilian/repo-example/blob/main/exercicios/para-casa/instrucoes-pull-request.md).

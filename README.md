<h1 align="center">
  <img src="assets/reprograma-fundos-claros.png" alt="logo reprograma" width="500">
</h1>

# Lidando com Bancos de Dados

## Turma ON35 | Python | Semana 7 | 2024 | Professora Camila Ribeiro

### Instruções

**Vamos começar a construir nosso conhecimento em bancos de dados!**

1. **Faça o Fork deste repositório!** 
    - Clique no botão "Fork" no canto superior direito da página do repositório.
    - Você terá uma cópia do repositório em sua conta do GitHub.
2. **Clone o repositório na sua máquina:**
    - Abra o seu terminal e digite:
    ```bash
    git clone https://github.com/seu-usuario/lidando-com-bancos-de-dados.git
    ```
    - Substitua "seu-usuario" pelo seu nome de usuário do GitHub.
3. **Entre na pasta do repositório:**
    - Abra o seu terminal e digite:
    ```bash
    cd lidando-com-bancos-de-dados
    ```

## Introdução

Nesta aula, vamos mergulhar no mundo dos bancos de dados relacionais, utilizando o SQLite como ferramenta para criar, manipular e consultar dados. Esta é a primeira de duas aulas que te levarão a dominar os bancos de dados!

## Objetivos da Aula

* Entender o que são bancos de dados e sua importância na análise de dados.
* Aprender os conceitos básicos de bancos de dados relacionais.
* Utilizar o SQLite e a ferramenta online SQLiteOnline.
* Executar comandos SQL básicos para criar, inserir, atualizar e consultar dados.
* Compreender relacionamentos entre tabelas e executar joins.

## Instalação e Configuração

### Ferramentas Necessárias

* **SQLiteOnline:** Ferramenta online para praticar SQL. Acesse: [https://sqliteonline.com/](https://sqliteonline.com/)

### Como Acessar o SQLiteOnline

1. Acesse o site do SQLiteOnline.
2. Clique em "Start" para iniciar a ferramenta.
3. Você verá uma interface com um editor SQL à esquerda e os resultados das consultas à direita.

## Conceitos Básicos de Banco de Dados

### O que é um Banco de Dados?

Um banco de dados é um sistema organizado para armazenar e gerenciar informações de forma eficiente.  Pense nele como um grande armário, dividido em gavetas (tabelas) que guardam informações sobre um tema específico.  Cada gaveta é organizada em colunas (campos) e linhas (registros).

**Exemplo:**

Imagine um banco de dados para uma biblioteca. 

* **Tabela:** Livros
* **Colunas:** Título, Autor, Ano, Gênero, Editora
* **Linhas:** Cada linha representa um livro específico, com informações sobre seu título, autor, ano de publicação, gênero e editora.

### Terminologia Básica

* **Tabela**: Estrutura que organiza os dados em linhas e colunas.
* **Linha (Registro)**: Um único conjunto de dados em uma tabela.
* **Coluna (Campo)**: Um único tipo de dado armazenado em uma tabela.
* **Chave Primária**: Identificador único para cada registro em uma tabela.
* **Chave Estrangeira**: Coluna que cria um vínculo entre duas tabelas.

## Introdução ao SQLite

### O que é o SQLite?

SQLite é um sistema de gerenciamento de banco de dados relacional, leve e incorporável. Ele é amplamente utilizado em aplicações web, dispositivos móveis e projetos de pequena escala.

### Vantagens do SQLite

* **Simplicidade e facilidade de uso:**  É fácil de configurar e usar, ideal para iniciantes.
* **Sem servidor:** Funciona diretamente no seu aplicativo, sem necessidade de um servidor dedicado.
* **Portabilidade e desempenho:** Pode ser usado em diversos sistemas operacionais e oferece bom desempenho.

## Tipos de Dados

No SQLite, assim como em outros bancos de dados, os **tipos de dados** determinam o formato e as características de cada informação que você armazena.

**Tipos de Dados Comuns no SQLite:**

* **TEXT:** Armazena strings de texto (ex: nomes, endereços, descrições).
* **INTEGER:** Armazena números inteiros (ex: id, ano).
* **REAL:** Armazena números de ponto flutuante (ex: preços, medidas).
* **BLOB:** Armazena dados binários (ex: imagens, arquivos).
* **NUMERIC:** Armazena números decimais com alta precisão.
* **BOOLEAN:** Armazena valores lógicos (TRUE ou FALSE).

## Comandos SQL por Categoria

### DDL (Data Definition Language)

**Função:** Define a estrutura do banco de dados, criando, alterando e excluindo objetos como tabelas, colunas, índices e outros elementos.

**Comandos:**

* **CREATE:**  Cria novos objetos.
    * **CREATE TABLE:** Criar uma nova tabela:
    ```sql
    CREATE TABLE tabela (
        coluna1 TIPO_DE_DADO,
        coluna2 TIPO_DE_DADO,
        ...
    );
    ```
    * **EXEMPLO:** Criar uma nova tabela chamada "Livros":
    ```sql
    CREATE TABLE Livros (
       Título TEXT,
       Autor TEXT,
       Ano INTEGER,
       Gênero TEXT
    );
    ```
* **DROP:**  Exclui objetos existentes.
    * **DROP TABLE:** Excluir uma tabela:
    ```sql
    DROP TABLE tabela;
    ```
    * **EXEMPLO:** Excluir a tabela "Livros":
    ```sql
    DROP TABLE Livros;
    ```
* **ALTER:** Altera a estrutura de objetos existentes.
    * **ALTER TABLE:** Adicionar uma nova coluna à tabela:
    ```sql
    ALTER TABLE tabela
    ADD COLUMN nova_coluna TIPO_DE_DADO;
    ```
    * **EXEMPLO:** Adicionar uma nova coluna chamada "Editora" à tabela "Livros":
    ```sql
    ALTER TABLE Livros
    ADD COLUMN Editora TEXT;
    ```
* **TRUNCATE:**  Exclui todos os dados de uma tabela, mas mantém a estrutura.
    * **TRUNCATE TABLE:** Excluir todos os dados de uma tabela:
    ```sql
    TRUNCATE TABLE tabela;
    ```
    * **EXEMPLO:** Excluir todos os dados da tabela "Livros", mas manter a estrutura da tabela:
    ```sql
    TRUNCATE TABLE Livros;
    ```
* **RENAME:** Renomeia objetos (tabelas, colunas, etc.).
    * **RENAME TABLE:** Renomear uma tabela:
    ```sql
    RENAME TABLE tabela TO nova_tabela;
    ```
    * **EXEMPLO:** Renomear a tabela "Livros" para "Obras":
    ```sql
    RENAME TABLE Livros TO Obras;
    ```

### DQL (Data Query Language)

**Função:** Permite consultar e recuperar dados do banco de dados.

**Comandos:**

* **SELECT:** Seleciona dados de uma ou mais tabelas.
    * **SELECT:** Selecionar todos os dados de uma tabela:
    ```sql
    SELECT * FROM tabela;
    ```
    * **EXEMPLO:** Selecionar todos os livros da tabela "Livros":
    ```sql
    SELECT * FROM Livros;
    ```
    * Selecionar colunas específicas de uma tabela:
    ```sql
    SELECT coluna1, coluna2 FROM tabela;
    ```
    * **EXEMPLO:** Selecionar os títulos e autores dos livros publicados após 2000:
    ```sql
    SELECT Título, Autor FROM Livros WHERE Ano > 2000;
    ```

### DML (Data Manipulation Language)

**Função:** Manipula os dados dentro das tabelas, inserindo, atualizando e excluindo registros. 

**Comandos:**

* **INSERT:** Insere novas linhas em uma tabela.
    * **INSERT INTO:** Inserir um novo registro em uma tabela:
    ```sql
    INSERT INTO tabela (coluna1, coluna2, ...)
    VALUES (valor1, valor2, ...);
    ```
    * **EXEMPLO:** Inserir um novo livro na tabela "Livros":
    ```sql
    INSERT INTO Livros (Título, Autor, Ano, Gênero) 
    VALUES ('O Senhor dos Anéis', 'J. R. R. Tolkien', 1954, 'Fantasia');
    ```
* **UPDATE:**  Altera dados em linhas existentes.
    * **UPDATE:** Atualizar dados em uma tabela:
    ```sql
    UPDATE tabela
    SET coluna1 = valor1, coluna2 = valor2, ...
    WHERE condição;
    ```
    * **EXEMPLO:** Atualizar o gênero do livro "O Senhor dos Anéis" para "Fantasia épica":
    ```sql
    UPDATE Livros 
    SET Gênero = 'Fantasia épica' 
    WHERE Título = 'O Senhor dos Anéis';
    ```
* **DELETE:**  Exclui linhas de uma tabela.
    * **DELETE FROM:** Excluir registros de uma tabela:
    ```sql
    DELETE FROM tabela
    WHERE condição;
    ```
    * **EXEMPLO:** Excluir o livro "O Senhor dos Anéis" da tabela "Livros":
    ```sql
    DELETE FROM Livros WHERE Título = 'O Senhor dos Anéis';
    ```
* **LOCK:**  Bloqueia linhas para evitar alterações simultâneas.
    ```sql
    BEGIN TRANSACTION;
    SELECT * FROM tabela WHERE condição FOR UPDATE;
    -- Faça a atualização da linha
    UPDATE tabela SET coluna = valor WHERE condição;
    COMMIT;
    ```
    * **EXEMPLO:** Bloqueia a linha com o título "O Senhor dos Anéis" para edição exclusiva:
    ```sql
    BEGIN TRANSACTION;
    SELECT * FROM Livros WHERE Título = 'O Senhor dos Anéis' FOR UPDATE;
    -- Faça a atualização da linha
    UPDATE Livros SET Gênero = 'Fantasia épica' WHERE Título = 'O Senhor dos Anéis';
    COMMIT;
    ```
* **CALL:** Chama uma função ou procedimento armazenado.
    ```sql
    CALL nome_do_procedimento(argumento1, argumento2, ...);
    ```
    * **EXEMPLO:** Supondo que exista um procedimento armazenado chamado "get_livros_por_genero":
    ```sql
    CALL get_livros_por_genero('Fantasia');
    ```
* **EXPLAIN PLAN:** Mostra o plano de execução de uma consulta, ajudando a otimizar a performance.
    ```sql
    EXPLAIN QUERY PLAN SELECT * FROM tabela WHERE condição;
    ```
    * **EXEMPLO:** Mostra o plano de execução da consulta "SELECT * FROM Livros WHERE Ano > 2000":
    ```sql
    EXPLAIN QUERY PLAN SELECT * FROM Livros WHERE Ano > 2000;
    ```

### DCL (Data Control Language)

**Função:** Controla o acesso aos dados do banco de dados, definindo permissões e privilégios para usuários e grupos.

**Comandos:**

* **GRANT:** Concede permissões a usuários.
    ```sql
    GRANT permissão ON tabela TO usuário;
    ```
    * **EXEMPLO:** Conceder permissão de leitura e escrita na tabela "Livros" ao usuário "Alice":
    ```sql
    GRANT SELECT, INSERT, UPDATE, DELETE ON Livros TO Alice;
    ```
* **REVOKE:**  Revoca permissões de usuários.
    ```sql
    REVOKE permissão ON tabela FROM usuário;
    ```
    * **EXEMPLO:** Retirar a permissão de escrita na tabela "Livros" do usuário "Alice":
    ```sql
    REVOKE INSERT, UPDATE, DELETE ON Livros FROM Alice;
    ```

### TCL (Transaction Control Language)

**Função:** Controla as transações no banco de dados, garantindo que todas as operações de uma transação sejam concluídas com sucesso ou que nenhuma seja aplicada caso ocorra um erro.

**Comandos:**

* **COMMIT:** Confirma as alterações de uma transação.
    ```sql
    COMMIT;
    ```
* **ROLLBACK:**  Reverte as alterações de uma transação.
    ```sql
    ROLLBACK;
    ```
* **SAVEPOINT:**  Cria um ponto de salvamento dentro de uma transação, permitindo reverter as alterações até esse ponto.
    ```sql
    SAVEPOINT nome_do_ponto_de_salvamento;
    ```
    * **EXEMPLO:** Cria um ponto de salvamento:
    ```sql
    SAVEPOINT my_savepoint;
    ```

<br>


## Links Úteis

* **Documentação do SQLite:** [https://www.sqlite.org/docs.html](https://www.sqlite.org/docs.html)
* **Tutorial de SQL W3Schools:** [https://www.w3schools.com/sql/](https://www.w3schools.com/sql/)
* **SQLite Tutorial:** [https://www.sqlitetutorial.net/](https://www.sqlitetutorial.net/)
* **Game SQL:** [https://sql-island.informatik.uni-kl.de/](https://sql-island.informatik.uni-kl.de/)
* **SQL Murder Mystery:** [https://mystery.knightlab.com/](https://mystery.knightlab.com/)
* **SQLZoo:** [https://sqlzoo.net/wiki/SQL_Tutorial](https://sqlzoo.net/wiki/SQL_Tutorial)

<br>

---

<br>

<p align="center">
Desenvolvido com :purple_heart:  
</p>

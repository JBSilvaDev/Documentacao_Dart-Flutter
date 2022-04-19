# Indrodução a MySQL

## Modelo de tabela SQL
| Nome do campo  | Tipo do campo   | Descricao|
| ------- | -------- | -------- |
| id   | INT- AUTO_INCREMENT    | Linha tipo inteira numeracao automarica |
| nome   | 	VARCHAR(100)    | Tipo e tamanho permido do campo |
| idade   | VARCHAR    | Tipo e tamanho permido do campo |


## SELECT
>O comando select é bastante simples e, serve para você, mostrar os dados da tabela. Sua sintaxe pode ser utilizado de algumas formas, como:
```sql
SELECT * FROM NOME_DA_TABELA;
```
- Exemplo 1:
```sql
SELECT * FROM clientes;
```
Nota 1: o asterisco indica que você deseja mostrar todos os campos, ou seja, id, nome, email e cidade (conforme a tabela do MySQL que você deseja exibir os registros).

- Exemplo 2:
```sql
SELECT nome, email FROM clientes;
```
Nota 2: neste caso, você está indicando que deseja mostrar somente nome e e-mail. Isso é interessante, pois a consulta é executa de forma mais rápida, já que você está trazendo menos informações da tabela.

## INSERT

O comando insert é bastante simples de ser utilizado. Sua sintaxe é composta da seguinte forma:
```sql
INSERT INTO NOME_DA_TABELA (CAMPOS_QUE_DESEJA_INSERIR_DADOS) VALUES (VALORES_DOS_CAMPOS).
```
Exemplo:
```sql
INSERT INTO clientes (nome, email, empresa) VALUES ('JBSilva', 'jbdev@dominio.com', 'JB Tec');
```
Nota 1: observe que não foi informado o campo id, já que o mesmo é AUTO_INCREMENT.

Nota 2: o comando values são os valores que correspondem aos campos que você informou no primeiro parentese, ou seja, os dados que serão inseridos. É necessário seguir a ordem que você especificou os campos.

Nota 3: no values, foi utilizado aspas simples já que os valores são STRINGS, isso é necessário porque campos do tipo VARCHAR ou CHAR são considerados Strings nos banco de dados.

## UPDATE

O comando update possui a sintaxe muito similar ao do INSERT, mas é utilizada para atualizar registros do banco de dados.
```sql
UPDATE NOME_DA_TABELA SET campo1 = valor1, campo2 = valor2.
```
Exemplo:
```sql
UPDATE clientes SET nome = 'Rafael', email = 'contato@jbtec.com.br';
```
Nota 1: observe que a cada campo que você deseja atualizar é necessário colocar uma virgula. E os campos só podem ser indicados depois do comando SET.

Nota 2: o comando update não deve ser executado desta maneira, ou então, irá atualizar todos os registros para o nome Rafael e e-mail contato@rlsystem.com.br. Isso acontece porque o comando WHERE não foi indicado. Quando o mesmo não é indicado o comando UPDATE atualizará todos os registros daquela tabela.

Assim, o ideial é que você indique o registro da tabela que deseja atualizar, conforme mostra abaixo.
```sql
UPDATE clientes SET nome = 'Rafael', email = 'contato@rlsystem.com.br' WHERE id = 1;
```
No exemplo acima, somente será atualizado o registro que conter o id 1.

## DELETE & TRUNCATE

O comando delete nunca deve ser utilizado sem a clasula WHERE. Caso contrário, irá deletar todos os registros da tabela. Sempre que você deseja apagar um registro, provalvelmente quer apagar um em espeficio. Assim, sempre é importante usar o WHERE, conforme o exemplo abaixo.
```sql
DELETE FROM NOME_DA_TABELA WHERE id = VALOR_DO_ID;
```
Exemplo:
```sql
DELETE FROM clientes WHERE id = 1;
```
Nota 1: desta forma, você estará excluindo o registro que conter o id 1.

O comando truncate é usado para limpar todo conteudo da tabela, apagando todos os registros linha a linha
```sql
TRUNCATE TABLE NOME_DA_TABELA;
```
Exemplo:
```sql
TRUNCATE TABLE clientes;
/* OU */
TRUNCATE TABLE bdName.clientes;
```

<br>
<br>
<br>

<b>

Site referencia: </b>[rlsystem](https://www.rlsystem.com.br/outros/noticia/select-insert-delete-update-mysql/)
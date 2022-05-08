# Indrodução a SQLite
- Todas as requisições e inserções sao feitas de modo [ascincrono](../../../Dart/Dart_OO/Async.md)
## Modelo de tabela SQL
| Nome do campo | Tipo do campo       | Descricao                               |
|---------------|---------------------|-----------------------------------------|
| id            | INT- AUTO_INCREMENT | Linha tipo inteira numeracao automarica |
| nome          | VARCHAR(100)        | Tipo e tamanho permido do campo         |

- Considerando a variavel database como abertura de conexao com SQLite
```dart
final database = await DatabaseSQLite().openConnection();
```
## EXIBIR DADOS DA TABELA BD
- O comando é bastante simples e, serve para você, mostrar os dados da tabela.
    - Modelo 1: Passa-se somente o nome da tabela
    ```dart
    await database.query('NOME_DA_TABELA')
    ```
    - Modelo 2: Comando SQL informa o que ira selecionar na tabela
    ```dart
    await database.rawQuery('select * from NOME_DA_TABELA')
    ```
Nota: Ambos os comandos ira exibir todo o conteudo da tabela indicada, o * no modelo 2 indica que ira exibir todos os dados da tabela.

## INSERIR DADOS A TABELA BD
- O comando consiste em informar a tabela e coluna onde deseja insetir os dados
    - Modelo 1: Passa-se o nome da tabela em em formato de mapa a coluna e valor a ser inserido.
    ```dart
    await database.insert('NOME_DA_TABELA', {'nome': 'JB'});
    ```
    - Modelo 2: Comando SQL informa a tabela que ira receber os valores passados em formato de lista
    ```dart
    await database.rawInsert('insert into NOME_DA_TABELA values(null, ?)', ['JB']);
    ```
Nota: Ambos os comandos irão inserir o nome JB na tabela criada

## ATUALIZANDO DADOS NA TABELA
- O comando consiste em atualizar um valor ja existente na tabela.
    - Modelo 1: Passa-se o nome da tabela no BD, o novo valor em formato de mapa a coluna onde sera atualizada e o valor que deve conter nesta coluna para ser alterado
    ```dart
    await database.update('NOME_DA_TABELA', {'nome': 'JBTec'}, where: 'nome = ?', whereArgs: ['JB']);
    ```
    - Modelo 2: Comando SQL informa a tabela setando a coluna que sera alterada e o valor que sera alterado, os valores deve ser passado em formato de lista na ordem correta.
    ```dart
    await database.rawUpdate('update NOME_DA_TABELA set nome = ? where id = ?', ['JBTec', 10]);
    ```
Nota : Ambos os comandos irão alterar um nome da tabela, modelo 1 altera conteudo da coluna nome que seja igual a JB, modelo 2 altera conteudo da coluna nome onde id é igual a 10.

## DELETANDO DADOS DA TABELA

- O comando consiste em deletar um dado na tabela do BD.
    - Modelo 1: Passa-se o nome da tabela a coluna e o valor desta coluna que deve ser deletado
    ```dart
    await database.delete('NOME_DA_TABELA', where: 'nome = ?', whereArgs: ['JB Silva']);
    ```
    Modelo 2: Comando SQL informa a tabela e coluna onde esta o valor a ser deletado, o valor é passado em lista
    ```dart
    await database.rawDelete('delete from NOME_DA_TABELA where id = ?', [10]);
    ```
Nota: Ambos os comandos deletam um item da tabela, modelo 1 deleta itens da coluna nome que sejam igual a JB Silva, modelo 2 deleta item que tenha seu id igual a 10

# Exibe dados de uma tabela no BD
- Seguir primeiramente os passos indicados em [MySQL](../../MYSQL.md)
- É possivel adicionar o comando em uma variavel, assim pode-se verificar por exemplo quantas linhas foram atingidas, ou numero do id criado.
- Outra funcao para variavel é quando se usa o select, assim é possivel armazenar o conteudo do BD na variavel criada em formato de lista com mapas ["": {}, {}], Exemplo : [Usando SELECT](../Modelos/Exibindo_dados_do_BD.md).
  - ```dart
      var varCheck = await mysqlConnection.query(
            'insert into aluno(id, nome, idade) values(?, ?, ?)',[null, 'nome', 0]);

      print('Linhas afetadas = ${variavel.affectedRows}');
      print('ID ${variavel.insertId} criado no BD');
      ```
- Criacão padão
  - ```dart
      Future<void> main() async {
        final database = DataBase();
        var mysqlConnection = await database.openConnection();
        await Future.delayed(Duration(seconds: 1));

        var resultadoSelect = await mysqlConnection.query(
            'select id, nome, idade from aluno'); 

        resultadoSelect.forEach((row) {print('ID: ${row[0]} \nNome: ${row['nome']} Idade: ${row['idade']}\n');
        });

        mysqlConnection.close();
      }
    ```
- O modelo acima:
    - Cria uma instacia do BD com:
        - ```dart
            final database = DataBase();
            ```
    - Abre uma conexão com o BD:
        - ```dart
            var mysqlConnection = await database.openConnection();
            ```
    - Seleciona coluna id, nome e idade da tabela aluno no BD com:
        - ```dart
          var resultadoSelect = await mysqlConnection.query('select id, nome, idade from aluno'); 
            ```
    - Exibe os dados da tabela no BD com:
        - ```dart
          resultadoSelect.forEach((row) {print('ID: ${row[0]} \nNome: ${row['nome']} Idade: ${row['idade']}\n');
          });
            ```
    - Fecha a conexão com:
        - ```dart
          mysqlConnection.close();
            ```   

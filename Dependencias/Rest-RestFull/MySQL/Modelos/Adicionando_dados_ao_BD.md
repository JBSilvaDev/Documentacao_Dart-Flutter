# Adicionando dados a tabela no BD
- Seguir primeiramente os passos indicados em [MySQL](../../MYSQL.md)
- Criacão padão
  - ```dart
      Future<void> main() async {
        final database = DataBase();
        var mysqlConnection = await database.openConnection();
        await Future.delayed(Duration(seconds: 1));

        var addInfoOne = await mysqlConnection.query(
            'insert into aluno(id, nome, idade) values(?, ?, ?)',
            [null, 'graci', 30]);

        var users = ['pedro', 'juca', 'ana', 'davi', 'rob', 'aroldo'];
        var idades = [10, 20, 30, 40, 50, 60];
        for (var i = 0; i < users.length; i++) {
          var addInfoTwoOrMore = await mysqlConnection
              .query('insert into aluno(nome, idade) values(?, ?)', [users[i], idades[i]]);
        }
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
    - Insere um unico dado a uma tabela com:
        - ID = auto
        - NOME = graci
        - IDADE = 30
        - ```dart
          var addInfoOne = await mysqlConnection.query(
              'insert into aluno(id, nome, idade) values(?, ?, ?)',
              [null, 'graci', 30]);
            ```
    - Insere varios dados a uma tabela com:
        - ID = auto
        - NOME = valor na lista users = ['pedro', 'juca', 'ana', 'davi', 'rob', 'aroldo'];
        - IDADE = valor na lista idades = [10, 20, 30, 40, 50, 60];
        - ```dart
          for (var i = 0; i < users.length; i++) {
            var addInfoTwoOrMore = await mysqlConnection
                .query('insert into aluno(nome, idade) values(?, ?)', [users[i], idades[i]]);
          }
            ```
    - Fecha a conexão com:
        - ```dart
          mysqlConnection.close();
            ```   

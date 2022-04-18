# Exibe dados de uma tabela no BD
- Seguir primeiramente os passos indicados em [MySQL](../../MYSQL.md)
- Criacão padão
  - ```dart
      Future<void> main() async {
        final database = DataBase();
        var mysqlConnection = await database.openConnection();
        await Future.delayed(Duration(seconds: 1));

        var deletaTabela = await mysqlConnection.query('drop table dart_mysql.teste');

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
    - Deleta a tabela teste no BD com:
        - ```dart
          var deletaTabela = await mysqlConnection.query('drop table dart_mysql.teste'); 
            ```
    - Fecha a conexão com:
        - ```dart
          mysqlConnection.close();
            ```   


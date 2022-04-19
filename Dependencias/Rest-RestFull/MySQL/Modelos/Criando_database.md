# Criando um database
- Seguir primeiramente os passos indicados em [MySQL](../../MYSQL.md)
- Criacão padão
    - ```dart
        Future<void> main() async {
            final database = DataBase();
            var mysqlConnection = await database.openConnection();
            await Future.delayed(Duration(seconds: 1));

            await mysqlConnection.query('create database newBD');

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
    - Cria um novo database de nome newBD:
        - ```dart
            await mysqlConnection.query('create database newBD');
            ```
    - Deleta um database:
        - ```dart
            await mysqlConnection.query('drop database newBD');
            ```
    - Fecha a conexão com:
        - ```dart
            mysqlConnection.close();
            ```   

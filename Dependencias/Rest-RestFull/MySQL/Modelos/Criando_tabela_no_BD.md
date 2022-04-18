# Criando uma tabela no BD SQL
- Seguir primeiramente os passos indicados em [MySQL](../../MYSQL.md)
- Criacão padão
    - ```dart
        Future<void> main() async {
        final database = DataBase();
        var mysqlConnection = await database.openConnection();
        await Future.delayed(Duration(seconds: 1));

        var novaTabela = await mysqlConnection.query(
            '''create table dart_mysql.teste2(
                id int not null primary key auto_increment,
                nome varchar(200),
                idade int)''');

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
    - Cria uma tabela com:
        - ID = inteiro, não nulo, chave primaria, e auto preenchido
        - NOME = campo de texto com capacidade maxima de 200 caracteres
        - IDADE = inteiro
        - ```dart
            var novaTabela = await mysqlConnection.query(
                '''create table dart_mysql.teste2(
                    id int not null primary key auto_increment,
                    nome varchar(200),
                    idade int)''');
            ```
    - Fecha a conexão com:
        - ```dart
            mysqlConnection.close();
            ```   

# Criando uma tabela no BD SQL
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

        await mysqlConnection.query(
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
            await mysqlConnection.query(
                '''create table dart_mysql.teste2(
                    id int not null primary key auto_increment,
                    nome varchar(200),
                    idade int)''');
            ```
    - Fecha a conexão com:
        - ```dart
            mysqlConnection.close();
            ```   

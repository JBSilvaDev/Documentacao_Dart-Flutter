# Deleta dados de uma tabela no BD
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

        await mysqlConnection.query('drop table dart_mysql.teste');

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
          await mysqlConnection.query('drop table dart_mysql.teste'); 
            ```
    - Fecha a conexão com:
        - ```dart
          mysqlConnection.close();
            ```   


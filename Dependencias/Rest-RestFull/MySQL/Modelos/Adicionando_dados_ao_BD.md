# Adicionando dados a tabela no BD
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
            'insert into aluno(id, nome, idade) values(?, ?, ?)',
            [null, 'graci', 30]);

        var users = ['pedro', 'juca', 'ana', 'davi', 'rob', 'aroldo'];
        var idades = [10, 20, 30, 40, 50, 60];
        for (var i = 0; i < users.length; i++) {
          await mysqlConnection
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
    - Note que para id é passado null, pois ele é auto encrementado
        - ID = auto
        - NOME = graci
        - IDADE = 30
        - ```dart
          await mysqlConnection.query(
              'insert into aluno(id, nome, idade) values(?, ?, ?)',
              [null, 'graci', 30]);
            ```
    - Insere varios dados a uma tabela com:
        - ID = auto
        - NOME = valor na lista users = ['pedro', 'juca', 'ana', 'davi', 'rob', 'aroldo'];
        - IDADE = valor na lista idades = [10, 20, 30, 40, 50, 60];
        - ```dart
          for (var i = 0; i < users.length; i++) {
            await mysqlConnection
                .query('insert into aluno(nome, idade) values(?, ?)', [users[i], idades[i]]);
          }
            ```
    - Fecha a conexão com:
        - ```dart
          mysqlConnection.close();
            ```   

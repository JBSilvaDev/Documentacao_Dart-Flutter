# Alterando dados de uma tabela no BD
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

        var resultado = await mysqlConnection.query('select nome from aluno'); 

        resultado.forEach((row) => print('Nome: ${row['nome']}'));

        await mysqlConnection.query('update aluno set nome = ? where id = ?', ['JB Silva', 1]);

        resultado = await mysqlConnection.query('select nome from aluno');
        resultado.forEach((row) => print('Nome: ${row['nome']}'));

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
    - Seleciona coluna nome da tabela aluno no BD com:
        - ```dart
            var resultado = await mysqlConnection.query('select nome from aluno');
            ```
    - Exibe os dados da tabela antes da alteração no BD com:
        - ```dart
            resultado.forEach((row) => print('Nome: ${row['nome']}'));
            ```
    - Altera um nome na tabela aluno onde o id é igual a 1:
        - ```dart
          await mysqlConnection.query('update aluno set nome = ? where id = ?', ['JB Silva', 1]);
          ```
    - Seleciona coluna nome da tabela aluno e exibe seus valores atualizados (apos alteracao):
        - ```dart
          resultado = await mysqlConnection.query('select nome from aluno');
          resultado.forEach((row) => print('Nome: ${row['nome']}'));
            ```
    - Fecha a conexão com:
        - ```dart
          mysqlConnection.close();
            ```   

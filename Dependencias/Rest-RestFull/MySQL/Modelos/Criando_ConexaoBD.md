# Criando conexão com BD SQL
- Seguir primeiramente os passos indicados em [MySQL](../../MYSQL.md)
- É possivel adicionar o comando em uma variavel, assim pode-se verificar por exemplo quantas linhas foram atingidas, ou numero do id criado.
- Outra funcao para variavel é quando se usa o select, assim é possivel armazenar o conteudo do BD na variavel criada em formato de lista com mapas ["": {}, {}], Exemplo : [Usando SELECT](../Modelos/Exibindo_dados_do_BD.md).
  - ```dart
      var varCheck = await mysqlConnection.query(
            'insert into aluno(id, nome, idade) values(?, ?, ?)',[null, 'nome', 0]);

      print('Linhas afetadas = ${variavel.affectedRows}');
      print('ID ${variavel.insertId} criado no BD');
      ```
- Conexao padrão
  - ```dart
      import 'package:mysql1/mysql1.dart';

      class DataBase {
        Future<MySqlConnection> openConnection() async {
          final settings = ConnectionSettings(
            host: 'localhost', // IP da maquina
            port: 3306,
            user: 'root',
            password: 'dylan2208',
            db: 'dart_mysql',
          );

          return await MySqlConnection.connect(settings);
        }
      }
      ```



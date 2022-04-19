# MySQL
>MySQL é um pacote do dart que usamos para efetuar requisicoes a um banco de dados atrasvez comandos SQL.<br>
Docs: [Clique aqui](https://pub.dev/packages/mysql1)<br>
Introdução: [Clique Aqui](/Dependencias/Rest-RestFull/MySQL/IntroSQL.md)
## Utilização
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
    mysql1: ^0.19.2 #(Ou qualquer outra versão na documentação)
```
- Efetuar o import no arquivo
```dart
import 'package:mysql1/mysql1.dart';
```
## Principais comandos MySQL
- Criando conexão com banco SQL
    - Seguir os passos acima
    - [Modelo](../Rest-RestFull/MySQL/Modelos/Criando_ConexaoBD.md)
- Criando um banco de dados
    - Caso nao esteja no mesmo arquivo, importar o arquivo com classe de criação de BD
    - [Modelo](../Rest-RestFull/MySQL/Modelos/Criando_database.md)
- Criando uma tabela em um BD
    - Caso nao esteja no mesmo arquivo, importar o arquivo com classe de criação de BD
    - [Modelo](../Rest-RestFull/MySQL/Modelos/Criando_tabela_no_BD.md)
- Adicionando conteudo a tabela no BD
    - Caso nao esteja no mesmo arquivo, importar o arquivo com classe de criação de BD
    - [Modelo](../Rest-RestFull/MySQL/Modelos/Adicionando_dados_ao_BD.md)
- Exibindo conteudo de uma tabela no BD
    - Caso nao esteja no mesmo arquivo, importar o arquivo com classe de criação de BD
    - [Modelo](../Rest-RestFull/MySQL/Modelos/Exibindo_dados_do_BD.md)
- Alterando conteudo de uma tabela no BD
    - Caso nao esteja no mesmo arquivo, importar o arquivo com classe de criação de BD
    - [Modelo](../Rest-RestFull/MySQL/Modelos/Alterando_dados_do_BD.md)
- Deleta uma tabela no BD
    - Caso nao esteja no mesmo arquivo, importar o arquivo com classe de criação de BD
    - [Modelo](../Rest-RestFull/MySQL/Modelos/Deleta_tabela_no_BD.md)
>Tratamento de erros
- Para tratar erro usamos o try/catch exemplo:
    - ```dart
        try {
            await mysqlConnection
                .query('update aluno set nome = ? where id = ?', [1 ,'JB Silvaaaa']);
        } on MySqlException catch(e) {
            print(e);
            print('Erro ao atualizar dados do aluno');
        }
        ```
>Validação de conteudo/codigo
- Usamos o transaction para efetuar uma validação, onde os dados só serao salvos no BD se todos forem executados sem erros.
- Isso é importante como exemplo efetuar uma transferencia entre bancos, os dados so podem ser deduzidos de um banco se for recebido em outro.
    - ```dart
        await mysqlConnection.transaction((_) async{
            await mysqlConnection
                .query('Comando de saida de dados']);
            await mysqlConnection
                .query('Comando de entrada de dados']);
        });
        ```
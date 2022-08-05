# Criando conexão com BD SQL
- Seguir primeiramente os passos indicados em [SQLite](../../SQLite.md)
- É possivel adicionar o comando em uma variavel
- Conexao é feita por funcao [asyncrona](../../../../Dart/Dart_OO/Async.md) dentro de uma classe.

## Classe e funcao de criação e conexão com BD, Usada em conjunto com [Path](../../Path.md)
  ```dart
  import 'package:path/path.dart';
  import 'package:sqflite/sqflite.dart';

  class DatabaseSQLite {
  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLite_exemple');
  }
  ```
## Conteudo return da funcao
  ```dart
  return await openDatabase()
  ```
- O openDatabse() é composto por:
  - variavel com link ([Path](../../Path.md)) da localização do BD definica na [conexao](Criando_ConexaoBD.md#classe-e-funcao-de-criação-e-conexão-com-bd-usada-em-conjunto-com-pathpathmd)
  - version: Recebe numero inteiro indicando a versao atual do BD
  - onConfigure: Recebe funcao async com 1 parametro *(db)*, seu conteudo é de configuração do BD
  - onCreate: Recebe funcao async com 2 paramentros *(Database db, int version)*, seu conteudo é para criação do BD inicial quando se usa o app pela primeira vez
  - onUpgrade: recebe funcao com 3 paramentros *(Database db, int oldVersion, int version)*, seu conteudo é para quando há atualização da versao do BD.
  - onDowngrade: recebe funcao com 3 paramentros *(Database db, int oldVersion, int version)*, seu conteudo é para quando um down na versao do BD.

>Tags a seguir sao defindas no return da funcao de conexao, dentro do ```openDatabase()```<br>
>Modelo base [SQLite](./MVVM/README.md)
### Variavel com link definida na [funcao](Criando_ConexaoBD.md#classe-e-funcao-de-criação-e-conexão-com-bd-usada-em-conjunto-com-pathpathmd)
```dart
databaseFinalPath
```
### onConfigure
- Sempre executada na abertura da conexao com BD, abaixo esta ativando conexoes com chaves estrangeiras
```dart
onConfigure: (db) async {
    await db.execute('PRAGMA foreing_keys = ON');
      },
```
### onCreate
- Executada somente na primeira vez que a conexao for feita, abaixo esta criando uma nova tabela no BD local
- batch.execute pode ser chamado *n* vezes enquando a conexao estiver aberta (antes de chamar o batch.commit())
```dart
onCreate: (Database db, int version) {
    final batch = db.batch();
    batch.execute('''
      create table teste(
        id Integer primary key autoincrement,
        nome varchar(200)
      )
      ''');
```
### onUpgrade
- Executada quando ha uma atualização na versao do BD, abaixo esta criando uma nova tabela no BD local, verificando se a versao anterior é menor que a atual.
- batch.execute pode ser chamado *n* vezes enquando a conexao estiver aberta (antes de chamar o batch.commit())
```dart
onUpgrade: (Database db, int oldVersion, int version) {
    final batch = db.batch();
    if (oldVersion < version) {
      batch.execute('''
      create table novaTable(
        id Integer primary key autoincrement,
        nome varchar(200)
      )
      ''');
```
### onDowngrade
- Execultada quando  há um downgrade da versao do BD, abaixo esta deletando uma tabela no BD local, verificando se a versao anterior é maior que a atual
- batch.execute pode ser chamado *n* vezes enquando a conexao estiver aberta (antes de chamar o batch.commit())
```dart
onDowngrade: (Database db, int oldVersion, int version) {
    final batch = db.batch();
    if (oldVersion > version) {
      batch.execute('''
      drop table categoria
      ''');
    }
```
- Apos cada comando onCreate, onUpgrade, onDowngrade é necessario chamar o commit para que seja execultado efetivamente
```dart
batch.commit();
```




```dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSQLite {
  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLite_exemple');

    return await openDatabase(
      databaseFinalPath,
      version: 3,
      onConfigure: (db) async {
        print('Configuração sendo execultada');
        await db.execute('PRAGMA foreing_keys = ON');
      },
      // chamado somente no momento de criacao do bd
      // primeira vez que o app é carregado
      onCreate: (Database db, int version) {
        print('Criando BD');
        final batch = db.batch();
        batch.execute('''
          create table teste(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
          ''');
        batch.execute('''
          create table produto(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
          ''');

        // batch.execute('''
        //   create table categoria(
        //     id Integer primary key autoincrement,
        //     nome varchar(200)
        //   )
        //   ''');

        batch.commit();
      },
      // chamado sempre que houver uma alteração na versao para mais (1 => 2)
      onUpgrade: (Database db, int oldVersion, int version) {
        print('Atualizando BD');

        final batch = db.batch();
        if (oldVersion < version) {
          batch.execute('''
          create table novao(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
          ''');
          // batch.execute('''
          // create table categoria(
          //   id Integer primary key autoincrement,
          //   nome varchar(200)
          // )
          // ''');
        }
        // if (oldVersion == 2) {
        //   batch.execute('''
        //   create table categoria(
        //     id Integer primary key autoincrement,
        //     nome varchar(200)
        //   )
        //   ''');
        // }
        batch.commit();
      },
      // chamado sempre que houver uma alteração na versao para menos (2 => 1)
      onDowngrade: (Database db, int oldVersion, int version) {
        print('Desatualizando BD');
        final batch = db.batch();
        if (oldVersion == 3) {
          batch.execute('''
          drop table categoria
          ''');
        }
        batch.commit();
      },
    );
  }
}
```
import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration.dart';

class MigrationImpl implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
  create table todo(
    id integer primary key autoincrement,
    descricao varchar(500) not null,
    data_hora datetime,
    finalizado integer
  )
''');
  }

  @override
  void update(Batch batch) {}

}

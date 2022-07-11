import 'package:todo_list_provider/app/core/database/migrations/migration.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_impl.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
    MigrationImpl(),
  ];

  List<Migration> getUpgradeMigration(int version) {
    var migrations = <Migration>[];
    if(version == 1){
      migrations.add(MigrationImpl()); // Aqui seria a nova migration ou seja atualzação do BD
    }
    return migrations;
  }
}

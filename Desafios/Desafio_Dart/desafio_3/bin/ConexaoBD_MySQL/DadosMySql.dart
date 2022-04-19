import 'package:mysql1/mysql1.dart';

class MySQLBD {
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

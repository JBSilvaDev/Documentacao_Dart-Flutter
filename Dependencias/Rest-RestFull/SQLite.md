# SQLite
>SQLite é um banco de dados local que é armazenado no proprio dispositivo que esta em uso.<br>
Docs: [Clique aqui](https://pub.dev/packages/sqflite)<br>
Introdução: [Clique Aqui](/Dependencias/Rest-RestFull/MySQL/IntroSQL.md)
## Utilização
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
    sqflite: ^2.0.2+1 #(Ou qualquer outra versão na documentação)
```
- Efetuar o import no arquivo
```dart
import 'package:sqflite/sqflite.dart';
// OU com alias para referenciar no codigo
import 'package:sqflite/sqflite.dart' as sqlite;
```
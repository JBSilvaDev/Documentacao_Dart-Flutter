# SQLite
>SQLite é um banco de dados local que é armazenado no proprio dispositivo que esta em uso.<br>
Docs: [Clique aqui](https://pub.dev/packages/sqflite)<br>
Introdução: [Clique Aqui](/Dependencias/Rest-RestFull/SQLite/SQLite.md)
## Utilização
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
    sqflite: ^2.0.2+1 #(Ou qualquer outra versão na documentação)
```
- Efetuar o import no arquivo
```dart
import 'package:sqflite/sqflite.dart';
```
## Principais comandos
- Criando BD/Tabela e Conectando
    - Seguir os passos acima
    - [Modelo](../Rest-RestFull/SQLite/Modelos/Criando_ConexaoBD.md)
- Manipulando conteudo
    - Seguir os passos acima    
    - [Modelo](../Rest-RestFull/SQLite/SQLite.md)

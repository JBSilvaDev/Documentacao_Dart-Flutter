# Configuração
## No .yaml
>Documentação: <br>
[pub.dev](https://pub.dev/packages/freezed)<br>
```yaml
dependencies:
  freezed: ^2.0.4 # Ou versao desejada
```
>Outros imports sao necessarios, alguns abaixo para mais veja documentação
```
flutter pub add freezed_annotation
flutter pub add --dev build_runner
flutter pub add --dev freezed
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_file.freezed.dart'; //Nome do arquivo a ser gerado pelo freezed
```
## Utilizazção
>Criar uma classe mixin base para gerar novo arquivo freezed
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _Person {
  factory Person({String? name, int? age}) = _Person;
}
```
>Apos modelo criado rodar no console
```dart
// Para rodar manualmente 1 a 1
dart run build_runner build
// Para rodar sempre que houver uma atualização
dart run build_runner watch
```
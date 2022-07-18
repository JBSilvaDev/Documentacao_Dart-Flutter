# Configuração
## No .yaml
- Usado em conjunto com ***Bloc***
>Documentação: <br>
[pub.dev](https://pub.dev/packages/equatable)<br>
```yaml
dependencies:
  equatable: ^2.0.3 #ou outra versão desejada
```
>Outro metodo de importação do pacote
```
flutter pub add equatable
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:equatable/equatable.dart';
```
## Utilizazção
>Na classe de estado invocar uma lista de props que ira verificar os itens na lista se sao registros repetidos
- A classe de estado deve ser uma extends de ```Equatable```
```dart
  @override
  List<Object> get props => [counter];
  ```

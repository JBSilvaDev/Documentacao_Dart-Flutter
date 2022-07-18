# Configuração
## No .yaml
- Usado em conjunto com ***Flutter Bloc***
>Documentação: <br>
Bloc - [pub.dev](https://pub.dev/packages/bloc)<br>
Flutter Bloc - [pub.dev](https://pub.dev/packages/flutter_bloc)<br>
```yaml
dependencies:
  bloc: ^8.0.3 #ou outra versão desejada
  flutter_bloc: ^8.0.1 #ou outra versão desejada
```
>Outro metodo de importação do pacote
```
flutter pub add flutter_bloc
flutter pub add bloc
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:bloc/bloc.dart';;
import 'package:flutter_bloc/flutter_bloc.dart';
```
## Utilizazção
>Criar 3 classes sendo para cada atividade do bloc
- Estado
- Evento
- Regra de negocio
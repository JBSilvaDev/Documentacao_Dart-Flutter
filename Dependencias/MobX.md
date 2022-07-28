# Configuração
## No .yaml
- Usado em conjunto com ***Flutter Bloc***
>Documentação: <br>
MobX - [pub.dev](https://pub.dev/packages/mobx)<br>
Flutter MobX - [pub.dev](https://pub.dev/packages/flutter_mobx)<br>
```yaml
dependencies:
  flutter_mobx: ^2.0.6+1 #ou outra versão desejada
  mobx: ^2.0.7+5 #ou outra versão desejada
```

>Outro metodo de importação do pacote
```
flutter pub add mobx
flutter pub add flutter_mobx
```
## No arquivo
>Importar conteúdo do package
```dart
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
```
## Utilizazção
>MobX é baseado em 3 pilares
- Observador
- Ação
- Reação
>Observador
- Representado pela classe ```Observable<Tipo>(valorAtualizável)``` Mais em [MobX_Modelo](../Flutter/Principais/MobX_Modelo.md)
>Ação
- Representado pela classe ```Action(funcaoDeAcao)``` normalmente iniciada como variavel tipo *late* pois é iniciada posteriormente em uma classe controladora. Mais em - [MobX_Modelo](../Flutter/Principais/MobX_Modelo.md)
>Reação
- É o resultado final, representado pela classe ```Observer(builder: (_) => Widget que recebe o valorAtualizável)```  o retorno é o que foi atualizado. Mais em - [MobX_Modelo](../Flutter/Principais/MobX_Modelo.md)
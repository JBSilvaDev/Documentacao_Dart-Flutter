>Usado juntamente com Selector do [Provider](./Provider.md)
# Configuração
## No .yaml
>Documentação: <br>
[pub.dev](https://pub.dev/packages/tuple)<br>
```yaml
dependencies:
  tuple: ^2.0.0 # Ou versao desejada
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:tuple/tuple.dart';
```
## Utilizazção
- Chamar na tipagem de widgets do [Provider](./Provider.md)
```dart
Selector<ProviderController, Tuple2<String, String>>(
    selector: (_, controller) => Tuple2(controller.instaciaDoModelo, controller.instaciaDoModelo),
    builder: (_, dados, __) {
        return Text(dados.item2); // OU Text(dados.item1);
    }),
```
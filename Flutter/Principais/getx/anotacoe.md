instalar package : get: ^4.6.5
quando usar o get se atentaar aos importes que sao feitos nem todas funcoes estao em todos os importes exemplo : (import 'package:get/get.dart';)

Instanciar o GetMaterialApp no arquivo main.dart

## Navegacao com get
> Avançar para uma pagina (push)
```dart
Get.to(Pagina());
```
> Retornar uma pagina (pop)
```dart
Get.back();
```
> Remove a pagina atual e substitui pela passada para nevegação (ao voltar a pagina nao estara disponivel)
```dart
Get.off(Pagina());
```

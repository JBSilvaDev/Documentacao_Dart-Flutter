# Get offAll
- Navegação comum equivalente ao pushAndRemoveUntil do flutter
- Utilização nativa:
```dart
    // Navegação de "ida" necessita ser nomeada para metodo nativo
    Navigator.of(context).push(MaterialPageRouter(
        builder:(context) => const PageName(),
        settings: const RouteSettings(name:'PageRouteName')
    ));
```
```dart
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRouter(
        builder:(context) => const PageName()
    ),
    (route) => false);
```
- Utilização get
```dart
    // Navegação de "ida" normal
    Get.to(const PageName());
```
```dart
    Get.offAll(const PageName());
```
- Em ambas as opções a nova pagina sera unica, nao sendo possivel retornar a paginas anteriores.
## Mantendo pagina especifica na fila
- Mantendo pagina para retorno
```dart
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRouter(
        builder:(context) => const PageName()
    ),
    ModelRoute.withName('PageRouteName)); // Nome da rota da pagina a ser mantida na fila
```
- Utilização get
```dart
    Get.offAll(const PageName(), predicate: ModelRoute.withName('/PageName));
```

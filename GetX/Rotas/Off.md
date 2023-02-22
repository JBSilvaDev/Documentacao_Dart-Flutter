# Get off
- Navegação comum equivalente ao pushReplacement do flutter
- Utilização nativa:
```dart
    Navigator.of(context).pushReplacement(MaterialPageRouter(
        builder:(context) => const PageName()
    ));
```
- Utilização get
```dart
    Get.off(const PageName());
```
- Em ambas as opções a pagina atual sera substitituida pela nova informada.
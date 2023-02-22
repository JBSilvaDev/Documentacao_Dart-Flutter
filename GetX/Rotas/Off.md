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
- Em ambas as opções a pagina nova ira substituir a pagina atual, nao sendo mais possivel voltar a mesma.
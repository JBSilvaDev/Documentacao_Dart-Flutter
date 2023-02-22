# Get to
- Navegação comum equivalente ao Push do flutter
- Utilização nativa:
```dart
    Navigator.of(context).push(MaterialPageRouter(
        builder: (context) {
            return const PageName();
        }
    ));
```
***
- Utilização get
```dart
    Get.to(const PageName());
```
- Em ambas as opções o usuario ira ser direcionado para a pagina informada.
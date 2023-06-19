# Get.to

- Navegação comum equivalente ao Push do Flutter.
- Utilização nativa:
```dart
Navigator.of(context).push(MaterialPageRoute(
  builder: (context) {
    return const PageName();
  }
));
```
***
- Utilização do Get:
```dart
Get.to(const PageName());
```
- Em ambas as opções, o usuário será direcionado para a página informada.

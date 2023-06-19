# Get offAll

- Navegação comum equivalente ao pushAndRemoveUntil do Flutter.
- Utilização nativa:
```dart
// Navegação "ida" precisa ser nomeada para o método nativo
Navigator.of(context).push(MaterialPageRouter(
  builder: (context) => const PageName(),
  settings: const RouteSettings(name: 'PageRouteName'),
));
```
```dart
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRouter(builder: (context) => const PageName()),
  (route) => false,
);
```

- Utilização do Get:
```dart
// Navegação "ida" normal
Get.to(const PageName());
```
```dart
Get.offAll(const PageName());
```

- Em ambas as opções, a nova página será única, não sendo possível retornar a páginas anteriores.

## Mantendo uma página específica na fila

- Mantendo uma página para retorno:
```dart
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRouter(builder: (context) => const PageName()),
  ModalRoute.withName('PageRouteName'), // Nome da rota da página a ser mantida na fila
);
```

- Utilização do Get:
```dart
Get.offAll(const PageName(), predicate: ModalRoute.withName('/PageName'));
```
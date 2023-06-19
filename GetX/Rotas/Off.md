# Get off

- Navegação comum equivalente ao pushReplacement do Flutter.
- Utilização nativa:
```dart
Navigator.of(context).pushReplacement(
  MaterialPageRouter(builder: (context) => const PageName()),
);
```

- Utilização do Get:
```dart
Get.off(const PageName());
```

- Em ambas as opções, a nova página substituirá a página atual, não sendo mais possível voltar à mesma.

# Get gerenciamento de estado basico
- Um gerenciamento de estado basico no **GetX** é uma variavel observavel que possa ser atualizada e se novo valor é exibido na tela sem precisar rebuildar toda ela.
> Variavel observavel no Get
```dart
final counter = 0.obs;
```
- Para atribuir um novo valor ou incrementar o valor existente a variavel pode-se usar uma função comum ou diretamente em um ***onPressed*** por exemplo, passando a variavel .value para o GetX entender que o valor dela que sera alterado
```dart
  onPressed: () {
      counter.value += 1;
    },
```
- Para fazer com que o valor sera sempre atualizado conforme ele seja alterado, é necessario envolver o widget de exibição da variavel em um ```Obx()```, assim o **GetX** saber que aquele widget deve ser reconstruido sempre que o novo valor for atribuido a variavel observavel
  ```dart
  Obx(() {
    return Text(
      '${counter.value}'
    );
  })
  ```
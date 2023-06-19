# GetX StateMixin

O `GetX StateMixin` é utilizado para controlar o estado de um objeto.

## Método de declaração

Para utilizar o mixin, passamos `StateMixin<ClasseOBJ>` como complemento da classe controladora:

```dart
class HomeControllerStateMixin extends GetxController with StateMixin<CepModel> {}
```

## Métodos para alterar o estado

Ao utilizar o `StateMixin`, temos acesso ao método `change()`, que recebe o estado da classe/objeto e o estado em que ela se encontra. Com base nesse estado, podemos executar alguma ação. Existem quatro métodos para alterar o estado:

- Vazio (`empty`):
  ```dart
  change(state, status: RxStatus.empty());
  ```

- Carregando (`loading`):
  ```dart
  change(state, status: RxStatus.loading());
  ```

- Sucesso (`success`):
  ```dart
  change(state, status: RxStatus.success());
  ```

- Erro (`error`):
  ```dart
  change(state, status: RxStatus.error());
  ```

## Exibição com base no estado

Podemos exibir widgets com base no estado fornecido utilizando o método `obx` do controlador:

```dart
controller.obx(
  // state é a classe/objeto passado no mixin (CepModel)
  (state) => const Text('Sou exibido se for sucesso'),
  onLoading: const Text('Sou exibido se estiver carregando'),
  onError: (error) => const Text('Sou exibido se ocorrer um erro'),
  onEmpty: const Text('Sou exibido se estiver vazio'),
)
```

O widget correspondente ao estado será exibido na tela, de acordo com a condição verificada.
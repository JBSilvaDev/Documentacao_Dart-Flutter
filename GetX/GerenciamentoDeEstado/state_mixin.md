# GetX StateMixin
- Usado para controlar o estado de um objeto
> Metodo de declarar
- Usa-se o mixin passando o ```StateMixin<ClasseOBJ>```
```dart
class HomeControllerStateMixin extends GetxController with StateMixin<CepModel> {}
```
- Quando o SteteMixin é passado como "complemento" da classe controladora é possivel usar a metodo change() que recebe o estado da classe/Objeto e o estado em que a mesma se encontra, e com base neste estado executar alguma ação.
- Para vazio
  - ```dart
    change(state, status: RxStatus.empyt());
    ```
- Para carregando
  - ```dart
    change(state, status: RxStatus.loading());
    ```
- Para sucesso
  - ```dart
    change(state, status: RxStatus.success());
    ```
- Para erro
  - ```dart
    change(state, status: RxStatus.error());
    ```
- Exibição com base na condição do estado passado
  - ```dart
      controller.obx(
        // state é o classe/Objeto passado no mixin (CepModel)
        (state) => const Text('Sou exibido se for success'),
        onLoading: const Text('Sou exibido se for loading'),
        onError: (error) =>
            const Text('Sou exibido se for error'),
        onEmpty: const Text('Sou exibido se for empyt'))
    ```
- O widget correspondente ao estado sera exibido na tela.
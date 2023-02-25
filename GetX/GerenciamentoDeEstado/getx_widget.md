# GetX Widget
- É um widget do pacote que serve como alternativa ao ```Obs()```
- Para seu uso não se faz necessario passar os bindings na rota, passando a classe controladora em sua tag *init*, e na sua tag builder passa-se uma função com paramentro que assumi o "poder" da controller, sendo assim possivel usar o conteudo da classe controladora instanciando a variavel do paramentro.
> Classe usada
```dart
class GetxWidgetController extends GetxController {
  final _nome = 'Jb Silva'.obs;

  String get nome => _nome.value;

  void alterarNome(String nomeNovo) {
    _nome(nomeNovo);
  }
}
```
> Utilização para consulta e alteração
- Tando o widget exibidor quanto a botao que faz alteração estao dentro do GetX Widget pois precisam da instancia da controller
```dart
GetX(
  init: GetxWidgetController(),
  builder: (controller) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(controller.nome),
      ElevatedButton(
          onPressed: () {
            controller.alterarNome('Nome alterado');
          },
          child: const Text('Alterar nome'))
    ],
  ),
),
```